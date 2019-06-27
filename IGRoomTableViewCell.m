#import "IGRoomTableViewCell.h"
@implementation IGRoomTableViewCell
+ (IGRoomTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"IGRoomTableViewCell";
    IGRoomTableViewCell *cell=(IGRoomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:[NSBundle bundleForClass:[NSClassFromString(@"IGRoomTableViewCell") class]]];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        cell = (IGRoomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = 30;
    self.headerImageView.layer.masksToBounds = YES;
}
-(void)setModel:(BSEventModel *)model{
    _model = model;
    self.headerImageView.image = [UIImage imageWithData:model.header_image];
    self.roomLabel.text = model.title;
    self.priceLabel.text = model.price;
    if (model.isState) {
        self.stateLabel.text = @"In use";
        self.stateLabel.textColor = SMColorFromRGB(0xeb5300);
    } else {
        self.stateLabel.text = @"Empty";
        self.stateLabel.textColor = SMColorFromRGB(0x448ADF);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
