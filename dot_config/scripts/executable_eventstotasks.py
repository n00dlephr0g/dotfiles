#!/bin/python3
import os
from icalendar import Calendar, Todo
from uuid import uuid4
from datetime import datetime

def ics_events_to_thunderbird_tasks(ics_filepath, output_filepath="tasks.ics"):
    """
    Converts VEVENT objects to VTODO objects in an ICS file, optimized for Thunderbird task import.
    """
    try:
        with open(ics_filepath, 'rb') as f:
            cal = Calendar.from_ical(f.read())

        new_cal = Calendar()
        new_cal.add('prodid', '-//Mozilla.org//Thunderbird iCalendar//EN')
        new_cal.add('version', '2.0')
        new_cal.add('method', 'REQUEST')  # Adding a METHOD

        for component in cal.walk():
            if component.name == "VEVENT":
                task = Todo()
                task.add('uid', str(uuid4()))  # Add a unique identifier for the task
                if component.get('SUMMARY'):
                    task.add('summary', component.get('SUMMARY'))
                if component.get('DESCRIPTION'):
                    task.add('description', component.get('DESCRIPTION'))
                if component.get('DTSTART'):
                    if hasattr(component.get('DTSTART'), 'dt'):
                        task.add('due', component.get('DTSTART').dt) # Use DTSTART as DUE
                task.add('status', 'NEEDS-ACTION') # Default status

                # Handle CATEGORIES if present
                if component.get('CATEGORIES'):
                    task.add('categories', component.get('CATEGORIES'))

                new_cal.add_component(task)
            elif component.name == "VTIMEZONE":
                new_cal.add_component(component)

        with open(output_filepath, 'wb') as outfile:
            outfile.write(new_cal.to_ical())

        print(f"Successfully converted events to Thunderbird-friendly tasks in '{output_filepath}'")

    except FileNotFoundError:
        print(f"Error: ICS file not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    ics_file = input("Enter path to your .ics file with events: ")
    output_file = input("Enter desired output .ics file for tasks (thunderbird_tasks.ics if blank): ")
    if not output_file:
        output_file = "thunderbird_tasks.ics"
    ics_events_to_thunderbird_tasks(ics_file, output_file)
