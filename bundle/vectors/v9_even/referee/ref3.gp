default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
/* idoneal by reduced-form enumeration: Cl(D) elementary 2 iff every reduced primitive form is ambiguous (b = 0, a = b or a = c) */
idon(n) = { my(D = -4*n, ok = 1); for(a = 1, sqrtint(n) + 1, for(b = -a + 1, a, if((b^2 - D) % (4*a), next); my(c = (b^2 - D)/(4*a)); if(c < a || (b < 0 && a == c) || gcd([a, b, c]) != 1, next); if(!(b == 0 || b == a || a == c), ok = 0))); ok; }
print("idoneal 12,28,60,18,72: ", apply(idon, [12, 28, 60, 18, 72]), "  20,4*5: ", idon(20), "  45: ", idon(45), " 9: ", idon(9));
print("odd m <= 2000 with 4m idoneal: ", select(m -> idon(4*m), [1..1999], 1)[1..min(10, #select(m -> m % 2 && idon(4*m), [1..1999]))]);
print("odd m <= 3000 with 4m idoneal: ", select(m -> m % 2 && idon(4*m), [1..3000]));
print("n <= 3000 with 9n idoneal: ", select(n -> idon(9*n), [1..3000]));
SH = [[1,0;0,1],[1,0;4,1],[1,4;0,1],[1,4;4,1],[7,0;0,7],[7,0;4,7],[7,4;0,7],[7,4;4,7]];
SG = [[1,0;0,1],[1,0;3,1],[5,0;0,5],[5,0;3,5]];
inS(M, S, N) = my(R = apply(e -> e % N, M)); #select(s -> s == R, S) > 0;
cntR(m, N, S, side) = { my(U = 0, F = 0); for(t = 0, N-1, for(s = 0, N-1, my(nx = (t^2 + m*s^2) % N); if(gcd(nx, N) == 1, U++; my(di = [1,0;0,lift(Mod(nx,N)^-1)], gx = [t, -m*s; s, t], g = if(side, di*gx, gx*di)); if(inS(g, S, N), F++)))); U/F; }
print("GG |W|/|S_P| for m mod 8, left/right diamond: ", vector(8, r, [cntR(r-1, 8, SH, 1), cntR(r-1, 8, SH, 0)]));
print("CF |W|/|S_P| for m mod 6, left/right diamond: ", vector(6, r, [cntR(r-1, 6, SG, 1), cntR(r-1, 6, SG, 0)]));
