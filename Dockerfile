ARG N8N_VERSION=stable

FROM n8nio/runners:${N8N_VERSION}

USER root

COPY requirements.txt /opt/runners/task-runner-python/requirements.txt

RUN cd /opt/runners/task-runner-javascript && \
    pnpm add moment uuid @napi-rs/canvas

RUN cd /opt/runners/task-runner-python && \
    uv pip install -r requirements.txt --python .venv/bin/python --no-cache-dir

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER runner
