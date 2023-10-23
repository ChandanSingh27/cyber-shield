import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Email configuration
sender_email = 'cks960100@gmail.com'
receiver_email = 'cks917356@gmail.com'
subject = 'Problem in Cyber Shield Application.'
message = input()

# SMTP server configuration for Gmail
smtp_server = 'smtp.gmail.com'
smtp_port = 587  # Use 587 for TLS
smtp_username = 'cks960100@gmail.com'
smtp_password = 'ywsc snxd dqbd awwh'

# Create a MIMEText object to represent the email message
msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = subject

# Attach the message to the email
msg.attach(MIMEText(message, 'plain'))

try:
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Use TLS for encryption
    server.login(smtp_username, smtp_password)
    server.sendmail(sender_email, receiver_email, msg.as_string())
    print('Email sent successfully!')
except Exception as e:
    print(f'An error occurred: {str(e)}')
finally:
    server.quit()

