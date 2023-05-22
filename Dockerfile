FROM public.ecr.aws/lambda/python:3.10

# yum: install devel & commands.
#RUN yum update -y && yum install -y gcc make ...

# pip: install python modules.
COPY Pipfile ./
COPY Pipfile.lock ./
RUN pip install pipenv && \
    pipenv requirements > requirements.txt && \
    pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code
COPY *.py ${LAMBDA_TASK_ROOT}

# Compatible with initial base image
CMD ["app.handler"]
