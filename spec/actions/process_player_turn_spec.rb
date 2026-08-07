describe Actions::ProcessPlayerTurn do
  describe '.run' do
    subject { described_class.run(clickable_area) }

    context 'if a clickable area was clicked' do
      let(:bone) { Game::Bone.new(2, 3) }
      let(:clickable_area) { instance_double(Graphics::ClickableArea, bone: bone) }

      before { Store::Settings.set(window_width: 200, window_height: 1900) }

      it 'toggles bone selection' do
        expect { subject }.to change { bone.selected? }.from(false).to(true)
      end

      shared_examples_for 'game refresher' do
        it 'refreshes the game' do
          expect(Game).to receive(:refresh)
          subject
        end
      end

      it_behaves_like 'game refresher'

      context 'if there are 2 selected bones' do
        let(:previously_selected_bone) { Game::Bone.new(*values) }

        before do
          previously_selected_bone.toggle_selection!

          row = Game::Row.new(3)
          row << bone
          row << previously_selected_bone

          Game::Pyramid << row
        end

        shared_examples_for 'bones selection toggler' do
          it 'deselects the bones' do
            expect { subject }.to change { [previously_selected_bone.selected?, bone.selected?] }.from([true, false]).to([false, false])
          end
        end

        context 'if the selected bones summary rank equals 12' do
          let(:values) { [2, 5] }
          let(:bones_to_reveal) { [Game::Bone.new(2, 4), Game::Bone.new(6, 0)] }

          before { allow(Actions::FindBonesToReveal).to receive(:run).and_return(bones_to_reveal) }

          it 'deletes the bones' do
            expect { subject }.to change { [previously_selected_bone.deleted?, bone.deleted?] }.from([false, false]).to([true, true])
          end

          it 'reveals the bones which can be revealed' do
            expect { subject }.to change { bones_to_reveal.map(&:revealed?) }.from([false, false]).to([true, true])
          end

          it_behaves_like 'bones selection toggler'
          it_behaves_like 'game refresher'
        end

        context 'if the selected bones summary rank does not equal 12' do
          let(:values) { [6, 3] }

          it 'does not delete any bones' do
            expect { subject }.not_to change { [previously_selected_bone.deleted?, bone.deleted?] }.from([false, false])
          end

          it 'does not look for any bones to reveal' do
            expect(Actions::FindBonesToReveal).not_to receive(:run)
            subject
          end

          it_behaves_like 'bones selection toggler'
          it_behaves_like 'game refresher'
        end
      end
    end
  end
end
