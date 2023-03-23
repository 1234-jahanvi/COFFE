ab = {'suggested_clock_frequency': ['100.0','99'],'suggested_clock_frequenc': 'sa'}
    
s = "sal"
print(type(ab['suggested_clock_frequency']))
print(type(ab['suggested_clock_frequenc']))
print(type(s))

try:
    res = str(ab['suggested_clock_frequenc'])
except ValueError:
    res = str(ab['suggested_clock_frequenc'])[0]
# if(type(ab['suggested_clock_frequency'])== str):
#     res = ab['suggested_clock_frequency']
# else:
#     res = ab['suggested_clock_frequency'][0]    
    
print(res)
data_file = open(DATA_SWEEP_PATH, 'w')
        data_file.write("param".ljust(40) + "value".ljust(20) + "\n")
        dashes = "-"*60
        data_file.write(dashes+ "\n")
        for param in param_list :
            data_file.write(param.ljust(40, '-'))
            for i in range(len(parameter_dict[param])) :
                data_file.write(str(parameter_dict[param][i]).ljust(20))

            data_file.write("\n")
        data_file.close()