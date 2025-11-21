FROM public.ecr.aws/aws-cli/aws-cli:latest

COPY run-task.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run-task.sh

ENTRYPOINT ["/usr/local/bin/run-task.sh"]