function figh = plot_tseries(rawdata_table)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    
    h_to_ms = 60*60*1e3;
    legstr = {};
    
    figh = figure('Name', 'Timeseries data');
    title('Timeseries data');
    
    % Left axis
    yyaxis left;
    set(gca, 'Fontsize', 12);
    hold(gca, 'all');
    
    plot(rawdata_table{:,'Abs. Timestamp / ms'}./h_to_ms, rawdata_table{:,'Current / A'}, 'Linewidth', 1.25);
    legstr = [legstr; 'Current / A'];
    plot(rawdata_table{:,'Abs. Timestamp / ms'}./h_to_ms, rawdata_table{:,'Temperature / °C'}, 'Linewidth', 1.25);
    legstr = [legstr; 'Temperature / °C'];
    if any(contains(rawdata_table.Properties.VariableNames, 'Soc / %'))
        plot(rawdata_table{:,'Abs. Timestamp / ms'}./h_to_ms, rawdata_table{:,'Soc / %'}, 'Linewidth', 1.25);
        legstr = [legstr; 'Soc / %'];
        ylabel(gca, 'Current / A  |  Temp / °C  |  Soc / %', 'Fontsize', 14);
    else
        ylabel(gca, 'Current / A  |  Temp /°C', 'Fontsize', 14);
    end
    
    % Right axis
    yyaxis right;
    set(gca, 'Fontsize', 12);
    hold(gca, 'all');
    plot(rawdata_table{:,'Abs. Timestamp / ms'}./h_to_ms, rawdata_table{:,'Voltage / V'}, 'Linewidth', 1.25);
    legstr = [legstr; 'Voltage / V'];
    if any(contains(rawdata_table.Properties.VariableNames, 'Charging Status / -'))
        plot(rawdata_table{:,'Abs. Timestamp / ms'}./h_to_ms, rawdata_table{:,'Charging Status / -'}, 'Linewidth', 1.25);
        legstr = [legstr; 'Charging Status / -'];
        ylabel(gca, 'Voltage / V  |  Ch. Stat. / -', 'Fontsize', 14);
    else
        ylabel(gca, 'Voltage / V', 'Fontsize', 14);
    end
     
    xlabel(gca, 'Abs. timestamp / h', 'Fontsize', 14);
    grid(gca, 'on'); 
    legend(legstr, 'Location', 'best');

end

