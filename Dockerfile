FROM ortussolutions/commandbox:lucee5

COPY . /app

WORKDIR /app  

EXPOSE 8080

# CMD ["box", "server", "start", "--console"] # adding console seems to keep process in foreground
CMD ["box", "server", "start"]