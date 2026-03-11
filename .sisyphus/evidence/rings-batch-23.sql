DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-isla',
    'Isla',
    'Isla - Oval 4 Claw Trilogy Engagement Ring',
    'Isla reimagines the classic trilogy with three matching oval stones in refined eagle-claw settings. A cathedral foundation lifts each stone, creating a balanced three-stone silhouette with quiet contemporary structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-isla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-isla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-isla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-isla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-isla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-isla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-isla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-isla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-isla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-isla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-isla-size-0', 1, v_id, 'D'),
      ('ring-isla-size-1', 2, v_id, 'E'),
      ('ring-isla-size-2', 3, v_id, 'F'),
      ('ring-isla-size-3', 4, v_id, 'G'),
      ('ring-isla-size-4', 5, v_id, 'H'),
      ('ring-isla-size-5', 6, v_id, 'I'),
      ('ring-isla-size-6', 7, v_id, 'J'),
      ('ring-isla-size-7', 8, v_id, 'K'),
      ('ring-isla-size-8', 9, v_id, 'L'),
      ('ring-isla-size-9', 10, v_id, 'M'),
      ('ring-isla-size-10', 11, v_id, 'N'),
      ('ring-isla-size-11', 12, v_id, 'O'),
      ('ring-isla-size-12', 13, v_id, 'P'),
      ('ring-isla-size-13', 14, v_id, 'Q'),
      ('ring-isla-size-14', 15, v_id, 'R'),
      ('ring-isla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-isla-specs',
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
    'ring-ivy',
    'Ivy',
    'Ivy - Oval 4 Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Ivy centres an oval stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ivy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ivy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ivy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ivy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ivy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ivy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ivy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ivy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ivy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ivy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ivy-size-0', 1, v_id, 'D'),
      ('ring-ivy-size-1', 2, v_id, 'E'),
      ('ring-ivy-size-2', 3, v_id, 'F'),
      ('ring-ivy-size-3', 4, v_id, 'G'),
      ('ring-ivy-size-4', 5, v_id, 'H'),
      ('ring-ivy-size-5', 6, v_id, 'I'),
      ('ring-ivy-size-6', 7, v_id, 'J'),
      ('ring-ivy-size-7', 8, v_id, 'K'),
      ('ring-ivy-size-8', 9, v_id, 'L'),
      ('ring-ivy-size-9', 10, v_id, 'M'),
      ('ring-ivy-size-10', 11, v_id, 'N'),
      ('ring-ivy-size-11', 12, v_id, 'O'),
      ('ring-ivy-size-12', 13, v_id, 'P'),
      ('ring-ivy-size-13', 14, v_id, 'Q'),
      ('ring-ivy-size-14', 15, v_id, 'R'),
      ('ring-ivy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ivy-specs',
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
    'ring-jacinta',
    'Jacinta',
    'Jacinta - Pear 5 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'Jacinta is a beautiful 5-claw pear solitaire design accentuated by a sparkling band of alternating marquise and round cut accent stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jacinta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jacinta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jacinta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jacinta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jacinta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jacinta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jacinta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jacinta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jacinta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jacinta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jacinta-size-0', 1, v_id, 'D'),
      ('ring-jacinta-size-1', 2, v_id, 'E'),
      ('ring-jacinta-size-2', 3, v_id, 'F'),
      ('ring-jacinta-size-3', 4, v_id, 'G'),
      ('ring-jacinta-size-4', 5, v_id, 'H'),
      ('ring-jacinta-size-5', 6, v_id, 'I'),
      ('ring-jacinta-size-6', 7, v_id, 'J'),
      ('ring-jacinta-size-7', 8, v_id, 'K'),
      ('ring-jacinta-size-8', 9, v_id, 'L'),
      ('ring-jacinta-size-9', 10, v_id, 'M'),
      ('ring-jacinta-size-10', 11, v_id, 'N'),
      ('ring-jacinta-size-11', 12, v_id, 'O'),
      ('ring-jacinta-size-12', 13, v_id, 'P'),
      ('ring-jacinta-size-13', 14, v_id, 'Q'),
      ('ring-jacinta-size-14', 15, v_id, 'R'),
      ('ring-jacinta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jacinta-specs',
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
    'ring-jackie',
    'Jackie',
    'Jackie - Pear East West Claw Solitaire with Bypass Band  Engagement Ring',
    'Jackie centres a pear stone in a four-claw east–west setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jackie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jackie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jackie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jackie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jackie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jackie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jackie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jackie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jackie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jackie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jackie-size-0', 1, v_id, 'D'),
      ('ring-jackie-size-1', 2, v_id, 'E'),
      ('ring-jackie-size-2', 3, v_id, 'F'),
      ('ring-jackie-size-3', 4, v_id, 'G'),
      ('ring-jackie-size-4', 5, v_id, 'H'),
      ('ring-jackie-size-5', 6, v_id, 'I'),
      ('ring-jackie-size-6', 7, v_id, 'J'),
      ('ring-jackie-size-7', 8, v_id, 'K'),
      ('ring-jackie-size-8', 9, v_id, 'L'),
      ('ring-jackie-size-9', 10, v_id, 'M'),
      ('ring-jackie-size-10', 11, v_id, 'N'),
      ('ring-jackie-size-11', 12, v_id, 'O'),
      ('ring-jackie-size-12', 13, v_id, 'P'),
      ('ring-jackie-size-13', 14, v_id, 'Q'),
      ('ring-jackie-size-14', 15, v_id, 'R'),
      ('ring-jackie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jackie-specs',
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
    'ring-jana',
    'Jana',
    'Jana - Pear and Marquise Claw Toi et Moi with Cathedral High Setting Engagement Ring',
    'The exquisite Jana toi et moi engagement ring showcases a pear cut and marquise cut stone placed side by side atop an elegant cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jana-size-0', 1, v_id, 'D'),
      ('ring-jana-size-1', 2, v_id, 'E'),
      ('ring-jana-size-2', 3, v_id, 'F'),
      ('ring-jana-size-3', 4, v_id, 'G'),
      ('ring-jana-size-4', 5, v_id, 'H'),
      ('ring-jana-size-5', 6, v_id, 'I'),
      ('ring-jana-size-6', 7, v_id, 'J'),
      ('ring-jana-size-7', 8, v_id, 'K'),
      ('ring-jana-size-8', 9, v_id, 'L'),
      ('ring-jana-size-9', 10, v_id, 'M'),
      ('ring-jana-size-10', 11, v_id, 'N'),
      ('ring-jana-size-11', 12, v_id, 'O'),
      ('ring-jana-size-12', 13, v_id, 'P'),
      ('ring-jana-size-13', 14, v_id, 'Q'),
      ('ring-jana-size-14', 15, v_id, 'R'),
      ('ring-jana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jana-specs',
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