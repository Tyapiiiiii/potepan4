require "csv"

# メモを管理するためのループ
while true do
    puts "1→新規でメモを作成する / 2→既存のメモを編集する"
    memo_type = gets.to_i

    if memo_type == 1
        puts "作成したいファイル名を入力してください。（拡張子は不要です）" # 文言をファイル名に調整しました
        file_memo = gets.chomp

        puts "メモしたい内容を入力してください。（入力を終了するには Ctrl + D を押してください）"
        memo_content = $stdin.readlines.join

        CSV.open("#{file_memo}.csv", "w") do |csv|
            csv << [memo_content]
        end
        
        puts "新しいメモを作成しました。" # ①先にメッセージを表示
        break                           # ②それからループを抜ける

    elsif memo_type == 2
        puts "編集したいファイル名を入力してください。（拡張子は不要です）"
        file_memo = gets.chomp

        puts "追記したい内容を入力してください。（入力を終了するには Ctrl + D を押してください）" # 文言を少し分かりやすく調整しました
        memo_content = $stdin.readlines.join

        CSV.open("#{file_memo}.csv", "a") do |csv|
            csv << [memo_content]
        end
        
        puts "メモを編集しました。" # ①先にメッセージを表示
        break                     # ②それからループを抜ける

    else
        puts "1か2を入力してください。"
        # ここは break しないので、自動的に while の最初（メニュー表示）に戻ります
    end
end