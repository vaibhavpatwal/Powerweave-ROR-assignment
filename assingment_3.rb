
def check_match_results(arr)
    matches_played = Hash.new(0)
    matches_won = Hash.new(0)
    matches_drawn = Hash.new(0)
    team_points = Hash.new(0)
    arr.each do |ele|
        main_array = ele.split(";")
        team_1 = main_array[0]
        team_2 = main_array[1]
        result = main_array[2]
        matches_played[team_1] +=1
        matches_played[team_2] +=1
        if result == "win"
            matches_won[team_1] +=1
        elsif result == "loss"
            matches_won[team_2] +=1
        else
            matches_drawn[team_1] +=1
            matches_drawn[team_2] +=1
        end
    end
    matches_played.each do |team_name,value|
        score = 3* matches_won[team_name] + matches_drawn[team_name]
        team_points[team_name] = score 
    end
    team_points = team_points.sort_by {|_key, value| value}.reverse.to_h
    p "Team | MP | W | D | L | P"
    team_points.each do |team_name, score|
        matches_loss = matches_played[team_name] - matches_won[team_name] - matches_drawn[team_name]
        played = matches_played[team_name]
        won = matches_won[team_name]
        draw = matches_drawn[team_name]
        p team_name + " " + played.to_s + "    " + won.to_s + "   " + draw.to_s + "   " + matches_loss.to_s + "   " + score.to_s
    end
end

check_match_results(["Team B;Team C;win",
                        "Team A;Team D;draw",
                        "Team A;Team B;win",
                        "Team D;Team C;loss",
                        "Team C;Team A;loss",
                        "Team B;Team D;win"
                    ])

