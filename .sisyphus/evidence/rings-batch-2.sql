DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-aisha',
    'Aisha',
    'Aisha - Marquise 6 Claw Solitaire with Flat Cigar Band and Hidden Halo Engagement Ring',
    'Aisha is a modern take on the timeless 6-claw solitaire design featuring a breathtaking marquise cut centre stone, a sparkling hidden halo, and a flat, straight edged cigar band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aisha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aisha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aisha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aisha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aisha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aisha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aisha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aisha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aisha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aisha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aisha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aisha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aisha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aisha-size-0', 1, v_id, 'D'),
      ('ring-aisha-size-1', 2, v_id, 'E'),
      ('ring-aisha-size-2', 3, v_id, 'F'),
      ('ring-aisha-size-3', 4, v_id, 'G'),
      ('ring-aisha-size-4', 5, v_id, 'H'),
      ('ring-aisha-size-5', 6, v_id, 'I'),
      ('ring-aisha-size-6', 7, v_id, 'J'),
      ('ring-aisha-size-7', 8, v_id, 'K'),
      ('ring-aisha-size-8', 9, v_id, 'L'),
      ('ring-aisha-size-9', 10, v_id, 'M'),
      ('ring-aisha-size-10', 11, v_id, 'N'),
      ('ring-aisha-size-11', 12, v_id, 'O'),
      ('ring-aisha-size-12', 13, v_id, 'P'),
      ('ring-aisha-size-13', 14, v_id, 'Q'),
      ('ring-aisha-size-14', 15, v_id, 'R'),
      ('ring-aisha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aisha-specs',
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
    'ring-alessia',
    'Alessia',
    'Alessia - Round Bezel Solitaire with Clustered Round-Marquise Mixed Set Shoulder Stones Engagement Ring',
    'Alessia features a round bezel-set centre stone complemented by round and marquise accents along the shoulders. A bold central form is balanced by gentle sparkle, resulting in a considered, contemporary design with layered detail. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alessia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alessia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alessia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alessia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alessia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alessia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alessia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alessia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alessia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alessia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alessia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alessia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alessia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alessia-size-0', 1, v_id, 'D'),
      ('ring-alessia-size-1', 2, v_id, 'E'),
      ('ring-alessia-size-2', 3, v_id, 'F'),
      ('ring-alessia-size-3', 4, v_id, 'G'),
      ('ring-alessia-size-4', 5, v_id, 'H'),
      ('ring-alessia-size-5', 6, v_id, 'I'),
      ('ring-alessia-size-6', 7, v_id, 'J'),
      ('ring-alessia-size-7', 8, v_id, 'K'),
      ('ring-alessia-size-8', 9, v_id, 'L'),
      ('ring-alessia-size-9', 10, v_id, 'M'),
      ('ring-alessia-size-10', 11, v_id, 'N'),
      ('ring-alessia-size-11', 12, v_id, 'O'),
      ('ring-alessia-size-12', 13, v_id, 'P'),
      ('ring-alessia-size-13', 14, v_id, 'Q'),
      ('ring-alessia-size-14', 15, v_id, 'R'),
      ('ring-alessia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alessia-specs',
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
    'ring-alex',
    'Alex',
    'Alex - Round 4 Claw Solitaire with Hidden Halo and Triple Pave Band Engagement Ring',
    'Alex is a beautiful round solitaire engagement ring with a sophisticated of a triple pavé band and hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alex';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alex-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alex-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alex-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alex/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alex/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alex-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alex-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alex-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alex-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alex-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alex-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alex-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alex-size-0', 1, v_id, 'D'),
      ('ring-alex-size-1', 2, v_id, 'E'),
      ('ring-alex-size-2', 3, v_id, 'F'),
      ('ring-alex-size-3', 4, v_id, 'G'),
      ('ring-alex-size-4', 5, v_id, 'H'),
      ('ring-alex-size-5', 6, v_id, 'I'),
      ('ring-alex-size-6', 7, v_id, 'J'),
      ('ring-alex-size-7', 8, v_id, 'K'),
      ('ring-alex-size-8', 9, v_id, 'L'),
      ('ring-alex-size-9', 10, v_id, 'M'),
      ('ring-alex-size-10', 11, v_id, 'N'),
      ('ring-alex-size-11', 12, v_id, 'O'),
      ('ring-alex-size-12', 13, v_id, 'P'),
      ('ring-alex-size-13', 14, v_id, 'Q'),
      ('ring-alex-size-14', 15, v_id, 'R'),
      ('ring-alex-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alex-specs',
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
    'ring-alexandria',
    'Alexandria',
    'Alexandria - Round 6 Claw Solitaire with Pave Band Engagement Ring',
    'Alexandria is a signature 6-claw solitaire design featuring a round cut centre stone and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alexandria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alexandria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexandria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexandria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexandria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexandria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alexandria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alexandria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alexandria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alexandria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexandria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alexandria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alexandria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alexandria-size-0', 1, v_id, 'D'),
      ('ring-alexandria-size-1', 2, v_id, 'E'),
      ('ring-alexandria-size-2', 3, v_id, 'F'),
      ('ring-alexandria-size-3', 4, v_id, 'G'),
      ('ring-alexandria-size-4', 5, v_id, 'H'),
      ('ring-alexandria-size-5', 6, v_id, 'I'),
      ('ring-alexandria-size-6', 7, v_id, 'J'),
      ('ring-alexandria-size-7', 8, v_id, 'K'),
      ('ring-alexandria-size-8', 9, v_id, 'L'),
      ('ring-alexandria-size-9', 10, v_id, 'M'),
      ('ring-alexandria-size-10', 11, v_id, 'N'),
      ('ring-alexandria-size-11', 12, v_id, 'O'),
      ('ring-alexandria-size-12', 13, v_id, 'P'),
      ('ring-alexandria-size-13', 14, v_id, 'Q'),
      ('ring-alexandria-size-14', 15, v_id, 'R'),
      ('ring-alexandria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alexandria-specs',
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
    'ring-alexia',
    'Alexia',
    'Alexia - Oval 4 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'The Alexia trilogy ring features a striking oval centre stone and two pear cut side stones seated within a cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alexia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alexia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alexia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alexia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alexia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alexia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alexia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alexia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alexia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alexia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alexia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alexia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alexia-size-0', 1, v_id, 'D'),
      ('ring-alexia-size-1', 2, v_id, 'E'),
      ('ring-alexia-size-2', 3, v_id, 'F'),
      ('ring-alexia-size-3', 4, v_id, 'G'),
      ('ring-alexia-size-4', 5, v_id, 'H'),
      ('ring-alexia-size-5', 6, v_id, 'I'),
      ('ring-alexia-size-6', 7, v_id, 'J'),
      ('ring-alexia-size-7', 8, v_id, 'K'),
      ('ring-alexia-size-8', 9, v_id, 'L'),
      ('ring-alexia-size-9', 10, v_id, 'M'),
      ('ring-alexia-size-10', 11, v_id, 'N'),
      ('ring-alexia-size-11', 12, v_id, 'O'),
      ('ring-alexia-size-12', 13, v_id, 'P'),
      ('ring-alexia-size-13', 14, v_id, 'Q'),
      ('ring-alexia-size-14', 15, v_id, 'R'),
      ('ring-alexia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alexia-specs',
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