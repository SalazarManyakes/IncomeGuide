#import "IGIncomeTableViewCell.h"
@implementation IGIncomeTableViewCell
+ (IGIncomeTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"IGIncomeTableViewCell";
    IGIncomeTableViewCell *cell=(IGIncomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"IGIncomeTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (IGIncomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    self.headerImageVIew.layer.cornerRadius = 25;
    self.headerImageVIew.layer.masksToBounds = YES;
}
-(void)setModel:(BSEventModel *)model{
    _model = model;
    self.headerImageVIew.image = [UIImage imageWithData:model.header_image];
    self.roomLabel.text = model.title;
    self.numberLabel.text = model.total_price;
}
-(void)setRoomModel:(IGRoomModel *)roomModel{
    _roomModel = roomModel;
    self.imageWidthCons.constant = 0;
    self.titleLeftCons.constant = 0;
    self.roomLabel.text = roomModel.start_time;
    self.numberLabel.text = roomModel.total_price;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
