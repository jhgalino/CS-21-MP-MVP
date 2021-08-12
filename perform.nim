import strutils, strformat

iterator moves(s: string): string =
    for i in 0 ..< s.len:
        if s[i].isAlphaAscii:
            try:
                if s[i+1] == '\'':
                    yield s[i..i+1]
                else:
                    yield s[i..i]
            except:
                yield s[i..i]

proc perform*(cube_state, action_seq: string): string {.raises: [].} =
    var rubix = newSeq[char](54)
    
    # convert cube state to sequence
    for i, v in cube_state.pairs:
        rubix[i] = v
    
    # convert action seq to sequence
    for i in action_seq.moves:

        if i == "F":
            let
                saved_1 = rubix[9]
                saved_2 = rubix[12]
                saved_3 = rubix[15]
                saved_5 = rubix[5]
                saved_6 = rubix[8]
              
            rubix[9] = rubix[42]
            rubix[12] = rubix[43]
            rubix[15] = rubix[44]
            rubix[42] = rubix[35]
            rubix[43] = rubix[32]
            rubix[44] = rubix[29]
            rubix[29] = rubix[45]
            rubix[32] = rubix[46]
            rubix[35] = rubix[47]
            rubix[45] = saved_3
            rubix[46] = saved_2
            rubix[47] = saved_1
            rubix[8] = rubix[2]
            rubix[5] = rubix[1]
            rubix[2] = rubix[0]
            rubix[1] = rubix[3]
            rubix[0] = rubix[6]
            rubix[3] = rubix[7]
            rubix[6] = saved_6
            rubix[7] = saved_5

        
        elif i == "B":
            let
                saved_1 = rubix[27]
                saved_2 = rubix[30]
                saved_3 = rubix[33]
                saved_4 = rubix[26]
                saved_5 = rubix[23]

            rubix[27] = rubix[38]
            rubix[30] = rubix[37]
            rubix[33] = rubix[36]
            rubix[38] = rubix[17]
            rubix[37] = rubix[14]
            rubix[36] = rubix[11]
            rubix[11] = rubix[53]
            rubix[14] = rubix[52]
            rubix[17] = rubix[51]
            rubix[51] = saved_3
            rubix[52] = saved_2
            rubix[51] = saved_1 
            rubix[26] = rubix[20]
            rubix[23] = rubix[19]
            rubix[20] = rubix[18]
            rubix[19] = rubix[21]
            rubix[18] = rubix[24]
            rubix[21] = rubix[25]
            rubix[24] = saved_4
            rubix[25] = saved_5
        
        elif i == "L":
            let
                saved_1 = rubix[0]
                saved_2 = rubix[3]
                saved_3 = rubix[6]
                saved_4 = rubix[32]
                saved_5 = rubix[35]
            
            rubix[0] = rubix[36]
            rubix[3] = rubix[39]
            rubix[6] = rubix[42]
            rubix[42] = rubix[20]
            rubix[39] = rubix[23]
            rubix[36] = rubix[26]
            rubix[26] = rubix[45]
            rubix[23] = rubix[48]
            rubix[20] = rubix[51]
            rubix[51] = saved_3
            rubix[48] = saved_2
            rubix[45] = saved_1
            rubix[35] = rubix[29]
            rubix[32] = rubix[28]
            rubix[29] = rubix[27]
            rubix[28] = rubix[30]
            rubix[27] = rubix[33]
            rubix[30] = rubix[34]
            rubix[33] = saved_5
            rubix[34] = saved_4


        elif i == "R":
            let
                saved_1 = rubix[18]
                saved_2 = rubix[21]
                saved_3 = rubix[24]
                saved_4 = rubix[17]
                saved_5 = rubix[14]

            rubix[18] = rubix[44]
            rubix[21] = rubix[41]
            rubix[24] = rubix[38]
            rubix[44] = rubix[8]
            rubix[41] = rubix[5]
            rubix[38] = rubix[2]
            rubix[2] = rubix[47]
            rubix[5] = rubix[50]
            rubix[8] = rubix[53]
            rubix[47] = saved_3
            rubix[50] = saved_2
            rubix[53] = saved_1
            rubix[17] = rubix[11]
            rubix[14] = rubix[10]
            rubix[11] = rubix[9]
            rubix[10] = rubix[12]
            rubix[9] = rubix[15]
            rubix[12] = rubix[16]
            rubix[15] = saved_4
            rubix[16] = saved_5
        
        elif i == "U":
            let
                saved_1 = rubix[9]
                saved_2 = rubix[10]
                saved_3 = rubix[11]
                saved_4 = rubix[41]
                saved_5 = rubix[44]

            rubix[9] = rubix[18]
            rubix[10] = rubix[19]
            rubix[11] = rubix[20]
            rubix[18] = rubix[27]
            rubix[19] = rubix[28]
            rubix[20] = rubix[29]
            rubix[27] = rubix[0]
            rubix[28] = rubix[1]
            rubix[29] = rubix[2]
            rubix[0] = saved_1
            rubix[1] = saved_2
            rubix[2] = saved_3
            rubix[44] = rubix[38]
            rubix[41] = rubix[37]
            rubix[38] = rubix[36]
            rubix[37] = rubix[39]
            rubix[36] = rubix[42]
            rubix[39] = rubix[43]
            rubix[42] = saved_5
            rubix[43] = saved_4
        
        elif i == "D":
            let
                saved_1 = rubix[6]
                saved_2 = rubix[7]
                saved_3 = rubix[8]
                saved_4 = rubix[50]
                saved_5 = rubix[53]

            rubix[6] = rubix[33]
            rubix[7] = rubix[34]
            rubix[8] = rubix[35]
            rubix[33] = rubix[24]
            rubix[34] = rubix[25]
            rubix[35] = rubix[26]
            rubix[24] = rubix[15]
            rubix[25] = rubix[16]
            rubix[26] = rubix[17]
            rubix[15] = saved_1
            rubix[16] = saved_2
            rubix[17] = saved_3
            rubix[53] = rubix[47]
            rubix[50] = rubix[46]
            rubix[47] = rubix[45]
            rubix[46] = rubix[48]
            rubix[45] = rubix[51]
            rubix[48] = rubix[52]
            rubix[51] = saved_5
            rubix[52] = saved_4
            
        elif i == "F'":
            let
                saved_1 = rubix[9]
                saved_2 = rubix[12]
                saved_3 = rubix[15]
                saved_4 = rubix[2]
                saved_5 = rubix[5]

            rubix[9] = rubix[47]
            rubix[12] = rubix[46]
            rubix[15] = rubix[45]
            rubix[45] = rubix[29]
            rubix[46] = rubix[32]
            rubix[47] = rubix[35]
            rubix[29] = rubix[44]
            rubix[32] = rubix[43]
            rubix[35] = rubix[42]
            rubix[42] = saved_1
            rubix[43] = saved_2
            rubix[44] = saved_3
            rubix[2] = rubix[8]
            rubix[5] = rubix[7]
            rubix[8] = rubix[6]
            rubix[7] = rubix[3]
            rubix[6] = rubix[0]
            rubix[3] = rubix[1]
            rubix[0] = saved_4
            rubix[1] = saved_5
        
        elif i == "B'":
            let 
                saved_1 = rubix[27]
                saved_2 = rubix[30]
                saved_3 = rubix[33]
                saved_4 = rubix[20]
                saved_5 = rubix[23]

            rubix[27] = rubix[51]
            rubix[30] = rubix[52]
            rubix[33] = rubix[53]
            rubix[53] = rubix[11]
            rubix[52] = rubix[14]
            rubix[51] = rubix[17]
            rubix[17] = rubix[38]
            rubix[14] = rubix[37]
            rubix[11] = rubix[36]
            rubix[36] = saved_3
            rubix[37] = saved_2
            rubix[38] = saved_1
            rubix[20] = rubix[26]
            rubix[23] = rubix[25]
            rubix[26] = rubix[24]
            rubix[25] = rubix[21]
            rubix[24] = rubix[18]
            rubix[21] = rubix[19]
            rubix[18] = saved_4
            rubix[19] = saved_5

        elif i == "L'":
            let
                saved_1 = rubix[0]
                saved_2 = rubix[3]
                saved_3 = rubix[6]
                saved_4 = rubix[29]
                saved_5 = rubix[32]

            rubix[0] = rubix[45]
            rubix[3] = rubix[48]
            rubix[6] = rubix[51]
            rubix[45] = rubix[26]
            rubix[48] = rubix[23]
            rubix[51] = rubix[20]
            rubix[26] = rubix[36]
            rubix[23] = rubix[39]
            rubix[20] = rubix[42]
            rubix[36] = saved_1
            rubix[39] = saved_2
            rubix[42] = saved_3
            rubix[29] = rubix[35]
            rubix[32] = rubix[34]
            rubix[35] = rubix[33]
            rubix[34] = rubix[30]
            rubix[33] = rubix[27]
            rubix[30] = rubix[28]
            rubix[27] = saved_4
            rubix[28] = saved_5
        
        elif i == "R'":
            let
                saved_1 = rubix[18]
                saved_2 = rubix[21]
                saved_3 = rubix[24]
                saved_4 = rubix[11]
                saved_5 = rubix[14]

            rubix[18] = rubix[53]
            rubix[21] = rubix[50]
            rubix[24] = rubix[47]
            rubix[53] = rubix[8]
            rubix[50] = rubix[5]
            rubix[47] = rubix[2]
            rubix[8] = rubix[44]
            rubix[5] = rubix[41]
            rubix[2] = rubix[38]
            rubix[44] = saved_1
            rubix[41] = saved_2
            rubix[38] = saved_3
            rubix[11] = rubix[17]
            rubix[14] = rubix[16]
            rubix[17] = rubix[15]
            rubix[16] = rubix[12]
            rubix[15] = rubix[9]
            rubix[12] = rubix[10]
            rubix[9] = saved_4
            rubix[10] = saved_5

        elif i == "U'":
            let
                saved_1 = rubix[9]
                saved_2 = rubix[10]
                saved_3 = rubix[11]
                saved_4 = rubix[38]
                saved_5 = rubix[41]

            rubix[9] = rubix[0]
            rubix[10] = rubix[1]
            rubix[11] = rubix[2]
            rubix[0] = rubix[27]
            rubix[1] = rubix[28]
            rubix[2] = rubix[29]
            rubix[27] = rubix[18]
            rubix[28] = rubix[19]
            rubix[29] = rubix[20]
            rubix[18] = saved_1
            rubix[19] = saved_2
            rubix[20] = saved_3
            rubix[38] = rubix[44]
            rubix[41] = rubix[43]
            rubix[44] = rubix[42]
            rubix[43] = rubix[39]
            rubix[42] = rubix[36]
            rubix[39] = rubix[37]
            rubix[36] = saved_4
            rubix[37] = saved_5

        elif i == "D'":
            let
                saved_1 = rubix[6]
                saved_2 = rubix[7]
                saved_3 = rubix[8]
                saved_4 = rubix[47]
                saved_5 = rubix[50]

            rubix[6] = rubix[15]
            rubix[7] = rubix[16]
            rubix[8] = rubix[17]
            rubix[15] = rubix[24]
            rubix[16] = rubix[25]
            rubix[17] = rubix[26]
            rubix[24] = rubix[33]
            rubix[25] = rubix[34]
            rubix[26] = rubix[35]
            rubix[33] = saved_1
            rubix[34] = saved_2
            rubix[35] = saved_3
            rubix[47] = rubix[53]
            rubix[50] = rubix[52]
            rubix[53] = rubix[51]
            rubix[52] = rubix[48]
            rubix[51] = rubix[45]
            rubix[48] = rubix[46]
            rubix[45] = saved_4
            rubix[46] = saved_5
        
        elif i == "H":
            let face = rubix[0..8]
            rubix[0..8] = rubix[27..35]
            rubix[27..35] = rubix[18..26]
            rubix[18..26] = rubix[9..17]
            rubix[9..17] = face

        elif i == "V":
            let face = rubix[0..8]
            rubix[0..8] = rubix[45..53]

            # rubix[45..53] = rubix[26..18]
            rubix[45] = rubix[26]
            rubix[46] = rubix[25]
            rubix[47] = rubix[24]
            rubix[48] = rubix[23]
            rubix[49] = rubix[22]
            rubix[50] = rubix[21]
            rubix[51] = rubix[20]
            rubix[52] = rubix[19]
            rubix[53] = rubix[18]
            # rubix[26..18] = rubix[36..44]
            rubix[26] = rubix[36]
            rubix[25] = rubix[37]
            rubix[24] = rubix[38]
            rubix[23] = rubix[39]
            rubix[22] = rubix[40]
            rubix[21] = rubix[41]
            rubix[20] = rubix[42]
            rubix[19] = rubix[43]
            rubix[18] = rubix[44]

            rubix[36..44] = face

        else:
            try:
                echo &"Error: letter {i} not found in commands"
            except Exception:
                echo getCurrentExceptionMsg()
        
    rubix.join("")