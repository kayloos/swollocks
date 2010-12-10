class YankProposalsController < ApplicationController

  def index
    @yank_proposals = YankProposal.all
  end

  def new
    @yank_proposal = YankProposal.new
  end

  def create
    @yank_proposal = YankProposal.new(params[:yank_proposal])
    if @yank_proposal.save
      flash[:success] = "We've added your stock to the database. It will be processed shortly."
    else
      flash[:error] = "We couldn't add your stock to the database."
    end
    redirect_to new_yank_proposal_path
  end

  def approve
    @yank_proposal = YankProposal.find(params[:id])
    @stock_yank = StockYank.new(:name => @yank_proposal.name, :symbol => @yank_proposal.symbol)
    if @stock_yank.save
      flash[:success] = "Proposal added to stock yanks"
    else
      flash[:error] = "Couldn't add proposal"
    end
    @yank_proposal.destroy
    update_quotes
    redirect_to yank_proposals_path
  end

  def destroy
    @yank_proposal = YankProposal.find(params[:id])
    if @yank_proposal.destroy
      flash[:success] = "Proposal destroyed"
    else
      flash[:error] = "Proposal wasn't destroyed"
    end
    redirect_to yank_proposals_path
  end

end
