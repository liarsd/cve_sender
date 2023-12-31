FROM python:3.11

LABEL "com.github.actions.name"="VulnAlerts"
LABEL "com.github.actions.description"="Daily customized CVE Alerts straight to your Slack Inbox for Free."
LABEL "version"="1.0"
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/liarsd/cve_sender"
LABEL "homepage"="https://github.com/liarsd/cve_sender"

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install --upgrade urllib3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY main.py entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
