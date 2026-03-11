DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-elsie',
    'Elsie',
    'Elsie - Marquise 6 Claw Solitaire with Hidden Halo, Opposing Marquise Accents and Cathedral Setting Engagement Ring',
    'The Elsie engagement ring showcases a stunning 6-claw marquise cut centre stone, sparkling hidden halo and an elegant cathedral setting featuring two pairs of opposing marquise cut side stones delicately graduating along the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elsie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elsie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elsie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elsie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elsie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elsie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elsie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elsie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elsie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elsie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elsie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elsie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elsie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elsie-size-0', 1, v_id, 'D'),
      ('ring-elsie-size-1', 2, v_id, 'E'),
      ('ring-elsie-size-2', 3, v_id, 'F'),
      ('ring-elsie-size-3', 4, v_id, 'G'),
      ('ring-elsie-size-4', 5, v_id, 'H'),
      ('ring-elsie-size-5', 6, v_id, 'I'),
      ('ring-elsie-size-6', 7, v_id, 'J'),
      ('ring-elsie-size-7', 8, v_id, 'K'),
      ('ring-elsie-size-8', 9, v_id, 'L'),
      ('ring-elsie-size-9', 10, v_id, 'M'),
      ('ring-elsie-size-10', 11, v_id, 'N'),
      ('ring-elsie-size-11', 12, v_id, 'O'),
      ('ring-elsie-size-12', 13, v_id, 'P'),
      ('ring-elsie-size-13', 14, v_id, 'Q'),
      ('ring-elsie-size-14', 15, v_id, 'R'),
      ('ring-elsie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elsie-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-ember',
    'Ember',
    'Ember Engagement Ring',
    'The Ember is a beautiful engagement ring from Cullen Jewellery.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ember';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ember-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ember/renders/2ct/High%20Setting/Yellow/main', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ember/renders/2ct/High%20Setting/Yellow/main')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ember-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ember-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ember-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ember-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ember-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ember-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ember-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ember-size-0', 1, v_id, 'D'),
      ('ring-ember-size-1', 2, v_id, 'E'),
      ('ring-ember-size-2', 3, v_id, 'F'),
      ('ring-ember-size-3', 4, v_id, 'G'),
      ('ring-ember-size-4', 5, v_id, 'H'),
      ('ring-ember-size-5', 6, v_id, 'I'),
      ('ring-ember-size-6', 7, v_id, 'J'),
      ('ring-ember-size-7', 8, v_id, 'K'),
      ('ring-ember-size-8', 9, v_id, 'L'),
      ('ring-ember-size-9', 10, v_id, 'M'),
      ('ring-ember-size-10', 11, v_id, 'N'),
      ('ring-ember-size-11', 12, v_id, 'O'),
      ('ring-ember-size-12', 13, v_id, 'P'),
      ('ring-ember-size-13', 14, v_id, 'Q'),
      ('ring-ember-size-14', 15, v_id, 'R'),
      ('ring-ember-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ember-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-emily',
    'Emily',
    'Emily - Oval 4 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'Emily is a beautiful oval solitaire design with four round claws, a slim tapered band and a stunning oval cut centre stone set low into a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emily';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emily-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emily-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emily-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emily/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emily/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emily-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emily-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emily-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emily-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emily-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emily-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emily-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emily-size-0', 1, v_id, 'D'),
      ('ring-emily-size-1', 2, v_id, 'E'),
      ('ring-emily-size-2', 3, v_id, 'F'),
      ('ring-emily-size-3', 4, v_id, 'G'),
      ('ring-emily-size-4', 5, v_id, 'H'),
      ('ring-emily-size-5', 6, v_id, 'I'),
      ('ring-emily-size-6', 7, v_id, 'J'),
      ('ring-emily-size-7', 8, v_id, 'K'),
      ('ring-emily-size-8', 9, v_id, 'L'),
      ('ring-emily-size-9', 10, v_id, 'M'),
      ('ring-emily-size-10', 11, v_id, 'N'),
      ('ring-emily-size-11', 12, v_id, 'O'),
      ('ring-emily-size-12', 13, v_id, 'P'),
      ('ring-emily-size-13', 14, v_id, 'Q'),
      ('ring-emily-size-14', 15, v_id, 'R'),
      ('ring-emily-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emily-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-emma',
    'Emma',
    'Emma - Classic Oval 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Popular for its timeless beauty, the Emma engagement ring is a classic 4-claw oval solitaire design complete with a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emma-size-0', 1, v_id, 'D'),
      ('ring-emma-size-1', 2, v_id, 'E'),
      ('ring-emma-size-2', 3, v_id, 'F'),
      ('ring-emma-size-3', 4, v_id, 'G'),
      ('ring-emma-size-4', 5, v_id, 'H'),
      ('ring-emma-size-5', 6, v_id, 'I'),
      ('ring-emma-size-6', 7, v_id, 'J'),
      ('ring-emma-size-7', 8, v_id, 'K'),
      ('ring-emma-size-8', 9, v_id, 'L'),
      ('ring-emma-size-9', 10, v_id, 'M'),
      ('ring-emma-size-10', 11, v_id, 'N'),
      ('ring-emma-size-11', 12, v_id, 'O'),
      ('ring-emma-size-12', 13, v_id, 'P'),
      ('ring-emma-size-13', 14, v_id, 'Q'),
      ('ring-emma-size-14', 15, v_id, 'R'),
      ('ring-emma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emma-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-emmy',
    'Emmy',
    'Emmy - Asscher 4 Claw Solitaire Engagement Ring',
    'The exquisite Emmy engagement ring features an asscher cut centre stone held by four eagle-tipped claws and set low into a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'asscher'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-emmy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-emmy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emmy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-emmy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/emmy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/emmy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-emmy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-emmy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-emmy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-emmy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-emmy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-emmy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-emmy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-emmy-size-0', 1, v_id, 'D'),
      ('ring-emmy-size-1', 2, v_id, 'E'),
      ('ring-emmy-size-2', 3, v_id, 'F'),
      ('ring-emmy-size-3', 4, v_id, 'G'),
      ('ring-emmy-size-4', 5, v_id, 'H'),
      ('ring-emmy-size-5', 6, v_id, 'I'),
      ('ring-emmy-size-6', 7, v_id, 'J'),
      ('ring-emmy-size-7', 8, v_id, 'K'),
      ('ring-emmy-size-8', 9, v_id, 'L'),
      ('ring-emmy-size-9', 10, v_id, 'M'),
      ('ring-emmy-size-10', 11, v_id, 'N'),
      ('ring-emmy-size-11', 12, v_id, 'O'),
      ('ring-emmy-size-12', 13, v_id, 'P'),
      ('ring-emmy-size-13', 14, v_id, 'Q'),
      ('ring-emmy-size-14', 15, v_id, 'R'),
      ('ring-emmy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-emmy-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;