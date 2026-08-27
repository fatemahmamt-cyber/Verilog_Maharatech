<html> 
    <head></head>
    <body>
        <table>
            <thead>
                <td><b>Port</b></td><td><b>Description</b></td><td><b>Type</b></td><td><b>Possible Values</b></td>
            </thead>
            <tr>
                <td>Front_Sensor</td><td>Generates 0 when someone exits and 1 unless</td><td>input</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Back_Sensor</td><td>Generates 0 when someone enters and 1 unless</td><td>input</td><td>0, 1</td>
            </tr>
            <tr>
                <td>T1</td><td>0: teller1 unavailable <br> 1: teller1 available</td><td>input</td><td>0, 1</td>
            </tr>
            <tr>
                <td>T2</td><td>0: teller2 unavailable <br> 1: teller2 available</td><td>input</td><td>0, 1</td>
            </tr>
            <tr>
                <td>T3</td><td>0: teller3 unavailable <br> 1: teller3 available</td><td>input</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Pcout</td><td>Number of Passengers in the Queue</td><td>output</td><td>0, 1, 2, 3, 4, 5, 6, 7</td>
            </tr>
            <tr>
                <td>Tcout</td><td>Number of Available Tellers</td><td>output</td><td>1, 2, 3</td>
            </tr>
            <tr>
                <td>Wtime</td><td> Expected waiting time in the queue before being served: <br> Wtime (Pcount = 0) = 0 <br> Wtime (Pcount != 0,Tcount) = 3*(Pcount+Tcount-1)/Tcount </td><td>output</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Full_Flag</td><td>0: empty queue <br> 1: full queue</td><td>output</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Empty_Flag</td><td>0: full queue <br> 1: empty queue</td><td>output</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Full_Alarm</td><td>0: no body tries to enter into full queue <br> 1: somebody tries to enter into full queue</td><td>output</td><td>0, 1</td>
            </tr>
            <tr>
                <td>Empty_Alarm</td><td>0: no body tries to exit from empty queue <br> 1: somebody tries to quit from empty queue</td><td>output</td><td>0, 1</td>
            </tr>
        </table>
    </body>
</html>