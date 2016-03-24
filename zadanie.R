eddypro = read.csv("eddypro (1).csv", skip = 1)[-1, c(1:69, 71:77)]
eddypro = eddypro[ , c(-32, -33, -37, -38, -63)]
eddypro$daytime = as.double(eddypro$daytime)
for(i in c(4, 6:length(eddypro))){
  eddypro[, i] = as.double(as.vector(eddypro[, i]))
}
eddypro[eddypro == -9999] = NA
eddypro[5291:6730, ] -> eddypro
eddypro[eddypro$daytime =="3", ] -> eddypro
eddypro2 = na.exclude(eddypro)
cor.matrix = round(cor(eddypro2[, c(-1, -2, -3, -4)]), 2)
model1 = lm(RH ~ (LE + h2o_flux + co2_molar_density + co2_mole_fraction + co2_mixing_ratio + h2o_molar_density + h2o_mole_fraction + h2o_mixing_ratio + air_temperature + water_vapor_density + VPD + Tdew)^12 - LE:h2o_flux:co2_molar_density:co2_mixing_ratio - LE:h2o_flux:h2o_mole_fraction:water_vapor_density - LE:co2_molar_density:h2o_molar_density:h2o_mole_fraction - LE:co2_molar_density:h2o_molar_density:water_vapor_density - LE:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction - co2_molar_density:h2o_molar_density:h2o_mole_fraction:water_vapor_density - h2o_molar_density:h2o_mole_fraction:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:h2o_molar_density - LE:h2o_flux:co2_molar_density:h2o_molar_density:VPD - LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:water_vapor_density - LE:h2o_flux:h2o_molar_density:water_vapor_density:VPD - LE:h2o_flux:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:VPD - LE:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:air_temperature - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:VPD - co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - LE:h2o_flux:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio - LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:air_temperature:VPD - LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:water_vapor_density:VPD - LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:VPD - LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mixing_ratio:water_vapor_density - LE:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mixing_ratio:water_vapor_density:VPD - co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - LE:h2o_flux:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:VPD - LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:VPD - LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density:VPD - h2o_flux:co2_molar_density:co2_mixing_ratio:h2o_molar_density:h2o_mixing_ratio:air_temperature:water_vapor_density - co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:h2o_flux:co2_molar_density:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density:VPD , data = eddypro)
anova(model1)
model2 = lm(RH ~ (LE + h2o_flux + co2_molar_density + co2_mole_fraction + co2_mixing_ratio + 
                    h2o_molar_density + h2o_mole_fraction + h2o_mixing_ratio + air_temperature + 
                    water_vapor_density + VPD + Tdew)^12 - LE:h2o_flux:co2_molar_density:co2_mixing_ratio -
              LE:h2o_flux:h2o_mole_fraction:water_vapor_density - 
              LE:co2_molar_density:h2o_molar_density:h2o_mole_fraction - 
              LE:co2_molar_density:h2o_molar_density:water_vapor_density - 
              LE:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - 
              co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction - 
              co2_molar_density:h2o_molar_density:h2o_mole_fraction:water_vapor_density -
              h2o_molar_density:h2o_mole_fraction:water_vapor_density:VPD - 
              LE:h2o_flux:co2_molar_density:co2_mole_fraction:h2o_molar_density - 
              LE:h2o_flux:co2_molar_density:h2o_molar_density:VPD - 
              LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:water_vapor_density - 
              LE:h2o_flux:h2o_molar_density:water_vapor_density:VPD - 
              LE:h2o_flux:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density -
              LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:VPD -
              LE:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:air_temperature - 
              co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio - 
              co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:VPD -
              co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - 
              LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - 
              LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - 
              LE:h2o_flux:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD -
              LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio -
              LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:air_temperature:VPD -
              LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:water_vapor_density:VPD - 
              LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:VPD - 
              LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mixing_ratio:water_vapor_density - 
              LE:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - 
              LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - 
              LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mixing_ratio:water_vapor_density:VPD - 
              co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - 
              co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              LE:h2o_flux:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:VPD - 
              LE:h2o_flux:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:VPD - 
              LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:VPD - 
              LE:h2o_flux:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              LE:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - 
              LE:co2_mole_fraction:co2_mixing_ratio:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              LE:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density:VPD -
              h2o_flux:co2_molar_density:co2_mixing_ratio:h2o_molar_density:h2o_mixing_ratio:air_temperature:water_vapor_density -
              co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density -
              co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD -
              LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:water_vapor_density:VPD - 
              LE:h2o_flux:co2_molar_density:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density - 
              LE:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density -
              LE:co2_molar_density:co2_mole_fraction:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - 
              co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density -
              co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density - LE:h2o_flux:co2_molar_density:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:water_vapor_density:VPD - h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:VPD - LE:h2o_flux:co2_molar_density:co2_mole_fraction:co2_mixing_ratio:h2o_molar_density:h2o_mole_fraction:h2o_mixing_ratio:air_temperature:water_vapor_density:VPD , data = eddypro)
anova(model2, model1)
l=coef(model2)
