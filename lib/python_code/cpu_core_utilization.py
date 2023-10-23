import psutil
import time
cpu_utilization = psutil.cpu_percent(interval=1, percpu=True)
print(cpu_utilization)