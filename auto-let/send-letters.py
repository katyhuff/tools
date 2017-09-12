#!/usr/bin/env python

import jinja2
import mimetypes
import numpy as np
import csv
import os
import smtplib
import sys
import getpass
import email
import email.utils
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase


def id_to_email(id):
    email = id+"@illinois.edu"
    return email 

if len(sys.argv) < 3:
    print('Usage: ./send-letter.py stu.tsv stu.txt.in')

with open(sys.argv[2], 'r') as fp:
    email_template = fp.read()
template = jinja2.Template(email_template)

with open(sys.argv[1], 'rU') as csvfile: 
    filereader = csv.reader(csvfile, delimiter=',', quotechar='"')
    students = []
    for row in filereader:
        student = {}
        if len(row) > 3 : 
            raise Exception("Too many columns in row with id "+row[0])
        student['last'] = row[0]
        student['first'] = row[1]
        student['email'] = id_to_email(row[2])
        students.append(student)

username = 'katyhuff@gmail.com'
password = getpass.getpass('password:')
server = smtplib.SMTP('smtp.gmail.com:587')
server.ehlo()
server.starttls()
server.login(username, password)

print(len(students))
for student in students:
    email_body = template.render(
        first = student['first'],
        last = student['last'],
        #gpa = student['gpa']
        ) 
    msg = MIMEMultipart('alternative')
    msg['Subject'] = 'Consider Applying to NEUP Scholarships & Fellowships'
    msg['From'] = 'Prof. Kathryn Huff <kdhuff@illinois.edu>'
    msg['To'] = student['email']
    msg['Cc'] = ''
    msg['Date'] = email.utils.formatdate()
    msg.attach(MIMEText(email_body, 'plain'))
    from_address = 'Prof. Kathryn Huff <kdhuff@illinois.edu>'
    to_address = [student['email']]

    print(email_body)
    server.sendmail(from_address, to_address, msg.as_string())

