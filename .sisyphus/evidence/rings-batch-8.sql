DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-avery',
    'Avery',
    'Avery - Oval 4 Double Claw Solitaire with Hidden Halo Engagement Ring',
    'The Avery engagement ring adds a unique touch to the classic oval solitaire design with four double-tipped claws, a basket setting and a hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-avery';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-avery-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-avery-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-avery-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/avery/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/avery/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-avery-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-avery-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-avery-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-avery-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-avery-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-avery-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-avery-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-avery-size-0', 1, v_id, 'D'),
      ('ring-avery-size-1', 2, v_id, 'E'),
      ('ring-avery-size-2', 3, v_id, 'F'),
      ('ring-avery-size-3', 4, v_id, 'G'),
      ('ring-avery-size-4', 5, v_id, 'H'),
      ('ring-avery-size-5', 6, v_id, 'I'),
      ('ring-avery-size-6', 7, v_id, 'J'),
      ('ring-avery-size-7', 8, v_id, 'K'),
      ('ring-avery-size-8', 9, v_id, 'L'),
      ('ring-avery-size-9', 10, v_id, 'M'),
      ('ring-avery-size-10', 11, v_id, 'N'),
      ('ring-avery-size-11', 12, v_id, 'O'),
      ('ring-avery-size-12', 13, v_id, 'P'),
      ('ring-avery-size-13', 14, v_id, 'Q'),
      ('ring-avery-size-14', 15, v_id, 'R'),
      ('ring-avery-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-avery-specs',
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
    'ring-ayla',
    'Ayla',
    'Ayla - Classic Radiant Claw Trilogy Engagement Ring',
    'Ayla reimagines the classic trilogy with three matching radiant-cut stones, each held in refined eagle-claw settings. A cathedral foundation elevates each stone, bringing balance, symmetry, and structural clarity. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ayla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ayla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ayla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ayla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ayla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ayla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ayla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ayla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ayla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ayla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ayla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ayla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ayla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ayla-size-0', 1, v_id, 'D'),
      ('ring-ayla-size-1', 2, v_id, 'E'),
      ('ring-ayla-size-2', 3, v_id, 'F'),
      ('ring-ayla-size-3', 4, v_id, 'G'),
      ('ring-ayla-size-4', 5, v_id, 'H'),
      ('ring-ayla-size-5', 6, v_id, 'I'),
      ('ring-ayla-size-6', 7, v_id, 'J'),
      ('ring-ayla-size-7', 8, v_id, 'K'),
      ('ring-ayla-size-8', 9, v_id, 'L'),
      ('ring-ayla-size-9', 10, v_id, 'M'),
      ('ring-ayla-size-10', 11, v_id, 'N'),
      ('ring-ayla-size-11', 12, v_id, 'O'),
      ('ring-ayla-size-12', 13, v_id, 'P'),
      ('ring-ayla-size-13', 14, v_id, 'Q'),
      ('ring-ayla-size-14', 15, v_id, 'R'),
      ('ring-ayla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ayla-specs',
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
    'ring-bella',
    'Bella',
    'Bella - Oval 4 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Vintage in style, Bella is a beautiful oval solitaire design framed by ten round cut side stones set low in a basket setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bella-size-0', 1, v_id, 'D'),
      ('ring-bella-size-1', 2, v_id, 'E'),
      ('ring-bella-size-2', 3, v_id, 'F'),
      ('ring-bella-size-3', 4, v_id, 'G'),
      ('ring-bella-size-4', 5, v_id, 'H'),
      ('ring-bella-size-5', 6, v_id, 'I'),
      ('ring-bella-size-6', 7, v_id, 'J'),
      ('ring-bella-size-7', 8, v_id, 'K'),
      ('ring-bella-size-8', 9, v_id, 'L'),
      ('ring-bella-size-9', 10, v_id, 'M'),
      ('ring-bella-size-10', 11, v_id, 'N'),
      ('ring-bella-size-11', 12, v_id, 'O'),
      ('ring-bella-size-12', 13, v_id, 'P'),
      ('ring-bella-size-13', 14, v_id, 'Q'),
      ('ring-bella-size-14', 15, v_id, 'R'),
      ('ring-bella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bella-specs',
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
    'ring-bethany',
    'Bethany',
    'Bethany - Oval 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral High Setting Engagement Ring',
    'Bethany adds a distinct flair to the timeless oval solitaire design with a tapered band, cathedral-style setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bethany';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bethany-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bethany-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bethany-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bethany/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bethany/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bethany-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bethany-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bethany-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bethany-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bethany-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bethany-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bethany-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bethany-size-0', 1, v_id, 'D'),
      ('ring-bethany-size-1', 2, v_id, 'E'),
      ('ring-bethany-size-2', 3, v_id, 'F'),
      ('ring-bethany-size-3', 4, v_id, 'G'),
      ('ring-bethany-size-4', 5, v_id, 'H'),
      ('ring-bethany-size-5', 6, v_id, 'I'),
      ('ring-bethany-size-6', 7, v_id, 'J'),
      ('ring-bethany-size-7', 8, v_id, 'K'),
      ('ring-bethany-size-8', 9, v_id, 'L'),
      ('ring-bethany-size-9', 10, v_id, 'M'),
      ('ring-bethany-size-10', 11, v_id, 'N'),
      ('ring-bethany-size-11', 12, v_id, 'O'),
      ('ring-bethany-size-12', 13, v_id, 'P'),
      ('ring-bethany-size-13', 14, v_id, 'Q'),
      ('ring-bethany-size-14', 15, v_id, 'R'),
      ('ring-bethany-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bethany-specs',
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
    'ring-bindi',
    'Bindi',
    'Bindi - Round 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Bindi is an exquisite round solitaire boasting four eagle-tipped claws and a dainty hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bindi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bindi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bindi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bindi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bindi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bindi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bindi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bindi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bindi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bindi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bindi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bindi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bindi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bindi-size-0', 1, v_id, 'D'),
      ('ring-bindi-size-1', 2, v_id, 'E'),
      ('ring-bindi-size-2', 3, v_id, 'F'),
      ('ring-bindi-size-3', 4, v_id, 'G'),
      ('ring-bindi-size-4', 5, v_id, 'H'),
      ('ring-bindi-size-5', 6, v_id, 'I'),
      ('ring-bindi-size-6', 7, v_id, 'J'),
      ('ring-bindi-size-7', 8, v_id, 'K'),
      ('ring-bindi-size-8', 9, v_id, 'L'),
      ('ring-bindi-size-9', 10, v_id, 'M'),
      ('ring-bindi-size-10', 11, v_id, 'N'),
      ('ring-bindi-size-11', 12, v_id, 'O'),
      ('ring-bindi-size-12', 13, v_id, 'P'),
      ('ring-bindi-size-13', 14, v_id, 'Q'),
      ('ring-bindi-size-14', 15, v_id, 'R'),
      ('ring-bindi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bindi-specs',
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