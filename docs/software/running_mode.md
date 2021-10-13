
## Monitor
When the board is booted correctly, it needed to read in some registers for safety of the board. For this we read in registers of monitor modules.  
To this it's exactly the same than LANewBa.
```
TODO
```

## SumX

SumX uses fifo, we need to monitor if those fifo are not full or empty. To this we should to read at the address `c_sumX_debug_fifo_offset`
```
R 0x009c0401 = 0 
```
This is a 7 bits words 
```
debug_fifo[6] = sop_misalign  
debug_fifo[5] = tx_dcifo_wrful  
debug_fifo[4] = tx_dcifo_rdemp  
debug_fifo[3] = rx_dcfifo_wrful  
debug_fifo[2] = rx_dcfifo_rdemp  
debug_fifo[1] = resync_scfifo_wrful  
debug_fifo[0] = resync_scfifo_rdemp  
```
It should be always at `'0'` else on error occurred, we can know which fifo is wrong by decoding the word.


## Recursive configuration

As it's explained here : [Software/Configuration files](Configuration_files.md) we need the possibility to reconfigure some modules in the FPGA.  
To this it's needed to reload the `recursive_configuration_board_X.conf` at each new pointing. 
