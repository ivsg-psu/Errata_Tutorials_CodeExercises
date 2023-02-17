% FCN_CODEX_10_BUYLOWSELLHIGH - a function to practice algorithmic trading
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
%        * A positive number means that money is being added into the market
%        - this number cannot be larger than the money currently "out" of
%        the market. 
%  
%        * A negative number means that money is being removed from the
%        market - this number cannot be larger than the number currently
%        invested "in" the market.
% 
%    current_market_index: this variable tracks how the market is behaving.
%    This signal will randomly increase, and then decrease at some point,
%    and then increase, and then decrease, etc. The goal is to "watch" ths
%    number so one can invest when the market is the most immediate lowest,
%    and take money out when the market is the most immediate highest. By
%    repeating this process, one can make money, even in a "losing" market
%    when the overall trend is downward. The market starts at 1. If it
%    increases to say 1.5, and there is $1 invested, then the value of the
%    investment is now $1.50.
%  
%    current_investment_value: this is how much is invested in the market
%    currently. When the function starts, this is just $1.
% 
%    current_money_available_to_invest: this is how much is NOT invested
%    presently, e.g. "out" of the market. When the function starts, this is
%    $0
% 
%    answer: this is the code that shows the problem is solved. It is
%    generated once the player has $1000 invested. The answer variable will
%    be empty until the "highest_peak" is correctly entered
% 
%    As in all the assignments, to check if the answer is correct, call
%    fcn_GradeCode and pass in the function name, student number, and answer.
% 
%    fcn_GradeCodeX('fcn_CodeX_10_BuyLowSellHigh', answer, student_number);
% 
%    If the answer is right, the grader prints information and gives the
%    entry code for the next problem. And if wrong, it indicates it is
%    wrong.
% 
%    NOTE: to reset the problem, type fcn_CodeX_10_BuyLowSellHigh with no
%    input arguments or output arguments
%