FROM ortussolutions/commandbox:lucee5

COPY . /app

WORKDIR /app  

EXPOSE 8080

# CMD ["box", "server", "start", "--console"] # adding console seems to keep process in foreground
# CMD ["box", "server", "start"]

# RUN box server start port=8080 serverHomeDirectory=/root/serverHome host=0.0.0.0 openbrowser=false saveSetting=false heapSize=4096 minHeapSize=4096 && box server stop
RUN box server start