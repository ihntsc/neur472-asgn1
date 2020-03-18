#Assignment 1 for NEUR472
#Biophysical model of a mammalian hair cell

using Plots

RMP = -0.06 #resting membrane potential (V)
g_leak = 1/(250.0e6) #leak conductance (S)
C = 30.0e-12 #capacitance (F)
REV_POT = -0.002 #channel reversal potential (V)
g_gate = 0.5e-9 #channel conductance (S)
N_CHANNELS = 48 #number of channels

tau = C/g_leak
d_t = 0.0001 #size of timesteps (s)
v_0 = 0.03 #starting voltage (V)

T = [t for t in 0.0:d_t:0.05]

V = fill(0.0, length(T))
V[1] = v_0
for i in 2:length(T)
    V[i] = V[i-1] - (d_t*V[i-1])/tau
end


gr()
plot(T, V, label="line")
xlabel!("Time (s)")
ylabel!("Voltage (V)")
