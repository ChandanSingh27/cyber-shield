import psutil
import time
def get_network_usage():
    network1 = psutil.net_io_counters()
    time.sleep(1)
    network2 = psutil.net_io_counters()
    received_bytes = network2.bytes_recv - network1.bytes_recv
    sent_bytes = network2.bytes_sent - network1.bytes_sent
    received_kibs = received_bytes / 1024
    sent_kibs = sent_bytes / 1024
    return received_kibs, sent_kibs

received, sent = get_network_usage()
print(f"[{received:.2f},{sent:.2f}]")

