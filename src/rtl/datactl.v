module datactl(data,
                in,
                data_ena
            );

            input [7:0] in;
            input data_ena;

            output [7:0] data;

            assign data = (data_ena) ? in : 8'bzzzzzzzz;
endmodule
