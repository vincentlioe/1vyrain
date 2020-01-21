mv *.FL1 BIOS.FL1 
dd if=BIOS.FL1 bs=1 of=BIOS.rom skip=464 count=4194304 
 
printf "32442D09-1D11-4E27-8AAB-90FE6ACB0489 10 O:02A0:778B1D826D24964E8E103467D56AB1BA \nF7731B4C-58A2-4DF4-8980-5645D39ECE58 10 P:44243080fb0175080fbae80f89442430:44243080fb01eb080fbae80f89442430 \nF7731B4C-58A2-4DF4-8980-5645D39ECE58 10 P:30488b4338f6000874080fba6c243014:30488b4338f60008eb080fba6c243014 \n" > patches.txt 
 
if grep -q "GCET" *.FL1; then 
    printf "79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:41390C240F84:41390C2490E9 \n79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:41390C240F858D:41390C240F8500 \n79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:41394C24047577:41394C24047500 \n79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:413AED0F8497FEFFFF:413AED0F8400000000 " >> patches.txt 
else
    printf "79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:C8390F0F84:C8390F90E9 \n79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:C8390F7516:C8390F7500 \n79E0EDD7-9D1D-4F41-AE1A-F896169E5216 10 P:C8394F0474:C8394F04EB" >> patches.txt 
fi 
 
./patcher ./BIOS.rom ./patches.txt -o ./patched.rom

echo "Patched BIOS saved as patched.rom"
