import psutil
memory = psutil.virtual_memory()
swap_memory = psutil.swap_memory()
print([memory.percent, swap_memory.percent])