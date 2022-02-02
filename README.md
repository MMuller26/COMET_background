# COMET_background

Calibration_BG_v1.m = file voor 1e oude laser meting PBS (gekregen van Harold)

Matlab_Background_Combined_Continunes.m = combineerd RMSE data continue metingen (huid MM, huid MS, lucht en aluminium) in plotjes 
- Temperatuur analyse toegevoegd waaruit blijkt dat dit verschil kan verklaren over tijd (huid laat sensor COMET opwarmen)
- hiervoor heb je .mat files nodig (RMSE.....mat)
- Losse files ....Skin_Continue.m  en other_Continue.m worden gebruikt om deze files aan te maken en vergelijking te maken tussen verschillende huiden en vergelijking tussen mid-air en aluminium

Matlab_Background_Combined_Lifetime_Plots.m = combineerd verschillende percentages achtergrond voor verschillende (niet continue) metingen
- hierin wordt niet continue metingen van COMET mid-air, huid (MM 2Hz) oude laser PBS (gekregen van Harold) in verschillende percentages (10-50%) t.o.v. mono-exponent vergeleken
- Ook wordt hier de RMSE voor niet continue metingen vergeleken
- hiervoor heb je .mat files nodig (....background.mat & lifetime_in.mat)

Matlab_Background_Combined_MitoPo2.m = idem hierboven maar dan in mitoPo2
- hiervoor heb je .mat files nodig (....mitoPO2.mat & PO2_in.mat)
- ....KnownLifetime.m files worden gebruikt om deze .mat files aan te maken (omzetting output lifetime naar mitoPo2 vindt hier plaats)

Matlab_Background_COMET_all.m = alle losse files voor niet continue meting (Matlab_Background_COMET_fiber.m ........Midair.m ......Skin.m & Calibration_BG_v1.m) verwerking van samengevoegd
- Hier wordt temperatuur van sensor ook mee vergeleken (--> zorgt hier niet voor verschillen)
- COMET 2Hz huid MM, 0.1Hz huid MM en MS met en zonder druk, COMET rechte fiber, gebogen fiber, mid-air, Oude laser PBS (gekregen van Harold0
- Hier wordt in plotjes onderlinge metingen vergeleken
- in de losse files (Matlab_Background_COMET_fiber.m & ......Skin.m) worden vergelijkingen tussen rechte en gebogen fiber en verschillende huiden & wel/niet drukken gedaan

Matlab_Background_OldLaserBeads_CombinedWells.m = COMBINED WELLS: analysis of old laser data ptf4 beads (OxNano) in decreasing concentration vs. pbs, empty and medium

Matlab_Background_OldLaserPdp_CombinedWells.m = COMBINED WELLS: analysis of old laser data pdp (palladium porforine) in decreasing concentration vs. pbs, empty and medium

Matlab_Background_OldLaserPdp_normalized.m = Genormaliseerde versie pdp (uitprobeersel!), mogelijk nog handig voor lifetime vergelijking bij dicht bij elkaar liggende amplitude?

Matlab_Background_OldLaserPBS_Continue.m = Uitprobeersel!
