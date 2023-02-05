% FCN_CODEX_10_BUYLOWSELLHIGH - find odd numbers
%    
%    Welcome to FCN_CODEX_10_BUYLOWSELLHIGH . In this assignment, players
%    participate in a virtual stock market seeking to turn a $1 investment
%    into $1000. In the process, players should realize that the core
%    algorithm behind the stock market is nearly identical to the child's
%    game of red-light/green-light!
% 
%    This function has the following form:
% 
%    [current_market_index, current_investment_value, current_money_available_to_invest, answer_10] = ...
%    fcn_CodeX_10_BuyLowSellHigh(entry_key,student_number,investment_in_or_out);
%  
%    investment_in_or_out: this is the amount to add to the investment or
%    take out. One cannot take out more money than is in the investment
%    (initially $1), and one cannot invest more money than is out of the
%    investment currently (initially $0).
% 
%    current_market_index: this variable tracks how the market is behaving.
%    This signal will increase, and then decrease at some point, and then
%    increase, and then decrease, etc. The goal is to "watch" ths number so
%    one can invest when the market is the most immediate lowest, and
%    take money out when the market is the most immediate highest. By
%    repeating this process, one can make money, even in a "losing" market
%    when the overall trend is downward. The market starts at 1. If it
%    increases to say 1.5, and there is $1 invested, then the value of the
%    investment is now $1.50.
%  
%    current_investment_value: this is how much is invested in the market
%    currently. When the function starts, this is just $1.
%