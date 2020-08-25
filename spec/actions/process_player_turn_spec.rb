describe Actions::ProcessPlayerTurn do
  describe '.run' do
    subject { described_class.run(double(x: 3, y: 55)) }

    context 'if it is a clickable area' do
      let(:bone) { Game::Bone.new(2, 3) }

      before { allow(Store::ClickableAreas).to receive(:find_clicked).with(3, 55).and_return(double(bone: bone, x: 13, y: 65)) }

      it 'toggles bone selection' do
        expect { subject }.to change { bone.selected? }.from(false).to(true)
      end

      context 'if there are 2 selected bones' do
        let(:row) { Game::Row.new(3) }

        before do
          Store::Settings.set(window_width: 200, window_height: 1900)

          allow(Store::ClickableAreas).to receive(:find_clicked).with(3, 55).and_return(double(bone: bone_2))

          bone_1.toggle_selection!

          row << bone_1
          row << bone_2

          Game::Pyramid << row
        end

        context 'if their summary rank equals 12' do
          let(:bone_1) { Game::Bone.new(2, 5) }
          let(:bone_2) { Game::Bone.new(0, 5) }

          it 'deletes both bones' do
            expect { subject }.to change { [bone_1.deleted?, bone_2.deleted?] }.from([false, false]).to([true, true])
          end

          it 'deselects both bones' do
            expect { subject }.to change { [bone_1.selected?, bone_2.selected?] }.from([true, false]).to([false, false])
          end
        end

        context 'if their summary rank does not equal 12' do
          let(:bone_1) { Game::Bone.new(2, 5) }
          let(:bone_2) { Game::Bone.new(6, 3) }

          it 'does not delete any bones' do
            expect { subject }.not_to change { [bone_1.deleted?, bone_2.deleted?] }.from([false, false])
          end

          it 'deselects both bones' do
            expect { subject }.to change { [bone_1.selected?, bone_2.selected?] }.from([true, false]).to([false, false])
          end
        end
      end
    end

    context 'if it is not a clickable area' do
      before { allow(Store::ClickableAreas).to receive(:find_clicked).with(3, 55).and_return(nil) }

      it 'doen not toggle any bones selection' do
        expect_any_instance_of(Game::Bone).not_to receive(:toggle_selection!)
      end
    end
  end
end
