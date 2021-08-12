import strutils, perform, solve

proc main() = 
    let cube_state: string = stdin.readLine
    let mode: int = stdin.readLine.parseInt

    # if mode is free mode
    if mode == 0:
        let action_seq: string = stdin.readLine
        echo cube_state.perform(action_seq)
    
    # if mode is solve mode
    else:
        let color_sym: string = stdin.readLine
        echo color_sym.solve(cube_state)

when isMainModule:
    main()