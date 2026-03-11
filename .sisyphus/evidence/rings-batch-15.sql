DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-daniela',
    'Daniela',
    'Daniela - Round 6 Claw Solitaire with Solid Cathedral High Setting Engagement Ring',
    'Simple and sophisticated, the Daniela engagement ring features a round cut centre stone and six eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-daniela';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-daniela-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daniela-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daniela-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-daniela-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-daniela-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-daniela-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-daniela-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-daniela-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-daniela-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-daniela-size-0', 1, v_id, 'D'),
      ('ring-daniela-size-1', 2, v_id, 'E'),
      ('ring-daniela-size-2', 3, v_id, 'F'),
      ('ring-daniela-size-3', 4, v_id, 'G'),
      ('ring-daniela-size-4', 5, v_id, 'H'),
      ('ring-daniela-size-5', 6, v_id, 'I'),
      ('ring-daniela-size-6', 7, v_id, 'J'),
      ('ring-daniela-size-7', 8, v_id, 'K'),
      ('ring-daniela-size-8', 9, v_id, 'L'),
      ('ring-daniela-size-9', 10, v_id, 'M'),
      ('ring-daniela-size-10', 11, v_id, 'N'),
      ('ring-daniela-size-11', 12, v_id, 'O'),
      ('ring-daniela-size-12', 13, v_id, 'P'),
      ('ring-daniela-size-13', 14, v_id, 'Q'),
      ('ring-daniela-size-14', 15, v_id, 'R'),
      ('ring-daniela-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-daniela-specs',
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
    'ring-delilah',
    'Delilah',
    'Delilah - Round 6 Claw Solitaire with Trellis Gallery and Cathedral Setting Engagement Ring',
    'Delilah adds flair to the classic round solitaire design with six round claws and a woven trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-delilah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-delilah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delilah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delilah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-delilah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-delilah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-delilah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-delilah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-delilah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-delilah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-delilah-size-0', 1, v_id, 'D'),
      ('ring-delilah-size-1', 2, v_id, 'E'),
      ('ring-delilah-size-2', 3, v_id, 'F'),
      ('ring-delilah-size-3', 4, v_id, 'G'),
      ('ring-delilah-size-4', 5, v_id, 'H'),
      ('ring-delilah-size-5', 6, v_id, 'I'),
      ('ring-delilah-size-6', 7, v_id, 'J'),
      ('ring-delilah-size-7', 8, v_id, 'K'),
      ('ring-delilah-size-8', 9, v_id, 'L'),
      ('ring-delilah-size-9', 10, v_id, 'M'),
      ('ring-delilah-size-10', 11, v_id, 'N'),
      ('ring-delilah-size-11', 12, v_id, 'O'),
      ('ring-delilah-size-12', 13, v_id, 'P'),
      ('ring-delilah-size-13', 14, v_id, 'Q'),
      ('ring-delilah-size-14', 15, v_id, 'R'),
      ('ring-delilah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-delilah-specs',
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
    'ring-delta',
    'Delta',
    'Delta - Elongated Hexagon 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'The Delta engagement ring is a striking step-cut elongated hexagon solitaire cradled within six eagle-tipped claws and encircled by a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-delta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-delta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-delta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-delta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-delta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-delta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-delta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-delta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-delta-size-0', 1, v_id, 'D'),
      ('ring-delta-size-1', 2, v_id, 'E'),
      ('ring-delta-size-2', 3, v_id, 'F'),
      ('ring-delta-size-3', 4, v_id, 'G'),
      ('ring-delta-size-4', 5, v_id, 'H'),
      ('ring-delta-size-5', 6, v_id, 'I'),
      ('ring-delta-size-6', 7, v_id, 'J'),
      ('ring-delta-size-7', 8, v_id, 'K'),
      ('ring-delta-size-8', 9, v_id, 'L'),
      ('ring-delta-size-9', 10, v_id, 'M'),
      ('ring-delta-size-10', 11, v_id, 'N'),
      ('ring-delta-size-11', 12, v_id, 'O'),
      ('ring-delta-size-12', 13, v_id, 'P'),
      ('ring-delta-size-13', 14, v_id, 'Q'),
      ('ring-delta-size-14', 15, v_id, 'R'),
      ('ring-delta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-delta-specs',
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
    'ring-elena',
    'Elena',
    'Elena - Oval 4 Claw Trilogy with Pear Side Stones and Tulip Detail Engagement Ring',
    'The Elena trilogy is a charming three-stone design featuring an oval cut centre stone, two pear cut side stones and a beautiful petal setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elena-size-0', 1, v_id, 'D'),
      ('ring-elena-size-1', 2, v_id, 'E'),
      ('ring-elena-size-2', 3, v_id, 'F'),
      ('ring-elena-size-3', 4, v_id, 'G'),
      ('ring-elena-size-4', 5, v_id, 'H'),
      ('ring-elena-size-5', 6, v_id, 'I'),
      ('ring-elena-size-6', 7, v_id, 'J'),
      ('ring-elena-size-7', 8, v_id, 'K'),
      ('ring-elena-size-8', 9, v_id, 'L'),
      ('ring-elena-size-9', 10, v_id, 'M'),
      ('ring-elena-size-10', 11, v_id, 'N'),
      ('ring-elena-size-11', 12, v_id, 'O'),
      ('ring-elena-size-12', 13, v_id, 'P'),
      ('ring-elena-size-13', 14, v_id, 'Q'),
      ('ring-elena-size-14', 15, v_id, 'R'),
      ('ring-elena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elena-specs',
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
    'ring-eliana',
    'Eliana',
    'Eliana - Emerald 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Eliana makes a statement with a striking high-set 4-claw emerald cut centre stone, wrap-around hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-eliana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-eliana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eliana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eliana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-eliana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-eliana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-eliana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-eliana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-eliana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-eliana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-eliana-size-0', 1, v_id, 'D'),
      ('ring-eliana-size-1', 2, v_id, 'E'),
      ('ring-eliana-size-2', 3, v_id, 'F'),
      ('ring-eliana-size-3', 4, v_id, 'G'),
      ('ring-eliana-size-4', 5, v_id, 'H'),
      ('ring-eliana-size-5', 6, v_id, 'I'),
      ('ring-eliana-size-6', 7, v_id, 'J'),
      ('ring-eliana-size-7', 8, v_id, 'K'),
      ('ring-eliana-size-8', 9, v_id, 'L'),
      ('ring-eliana-size-9', 10, v_id, 'M'),
      ('ring-eliana-size-10', 11, v_id, 'N'),
      ('ring-eliana-size-11', 12, v_id, 'O'),
      ('ring-eliana-size-12', 13, v_id, 'P'),
      ('ring-eliana-size-13', 14, v_id, 'Q'),
      ('ring-eliana-size-14', 15, v_id, 'R'),
      ('ring-eliana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-eliana-specs',
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