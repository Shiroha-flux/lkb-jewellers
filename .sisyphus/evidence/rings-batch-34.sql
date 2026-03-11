DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-nora',
    'Nora',
    'Nora - Emerald Claw Solitaire with Spiral Gallery and Cathedral Low Setting Engagement Ring',
    'The beautiful Nora engagement ring showcases an elegant emerald cut centre stone atop a uniquely twisted 4-claw cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nora';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nora-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nora-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nora-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nora-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nora-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nora-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nora-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nora-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nora-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nora-size-0', 1, v_id, 'D'),
      ('ring-nora-size-1', 2, v_id, 'E'),
      ('ring-nora-size-2', 3, v_id, 'F'),
      ('ring-nora-size-3', 4, v_id, 'G'),
      ('ring-nora-size-4', 5, v_id, 'H'),
      ('ring-nora-size-5', 6, v_id, 'I'),
      ('ring-nora-size-6', 7, v_id, 'J'),
      ('ring-nora-size-7', 8, v_id, 'K'),
      ('ring-nora-size-8', 9, v_id, 'L'),
      ('ring-nora-size-9', 10, v_id, 'M'),
      ('ring-nora-size-10', 11, v_id, 'N'),
      ('ring-nora-size-11', 12, v_id, 'O'),
      ('ring-nora-size-12', 13, v_id, 'P'),
      ('ring-nora-size-13', 14, v_id, 'Q'),
      ('ring-nora-size-14', 15, v_id, 'R'),
      ('ring-nora-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nora-specs',
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
    'ring-octavia',
    'Octavia',
    'Octavia - Round 4 Claw Trilogy with Round Side Stones and Trellis Gallery Engagement Ring',
    'Octavia is a timeless trilogy design featuring round cut stones and a beautiful woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-octavia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-octavia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-octavia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-octavia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-octavia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-octavia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-octavia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-octavia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-octavia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-octavia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-octavia-size-0', 1, v_id, 'D'),
      ('ring-octavia-size-1', 2, v_id, 'E'),
      ('ring-octavia-size-2', 3, v_id, 'F'),
      ('ring-octavia-size-3', 4, v_id, 'G'),
      ('ring-octavia-size-4', 5, v_id, 'H'),
      ('ring-octavia-size-5', 6, v_id, 'I'),
      ('ring-octavia-size-6', 7, v_id, 'J'),
      ('ring-octavia-size-7', 8, v_id, 'K'),
      ('ring-octavia-size-8', 9, v_id, 'L'),
      ('ring-octavia-size-9', 10, v_id, 'M'),
      ('ring-octavia-size-10', 11, v_id, 'N'),
      ('ring-octavia-size-11', 12, v_id, 'O'),
      ('ring-octavia-size-12', 13, v_id, 'P'),
      ('ring-octavia-size-13', 14, v_id, 'Q'),
      ('ring-octavia-size-14', 15, v_id, 'R'),
      ('ring-octavia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-octavia-specs',
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
    'ring-olive',
    'Olive',
    'Olive - Statement Emerald Bezel Solitaire with East West Setting and Open Cathedral High Setting Engagement Ring',
    'Olive is a beautifully refined design featuring an east-west emerald cut centre stone on a cathedral bezel setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-olive';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-olive-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olive-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olive-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-olive-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-olive-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-olive-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-olive-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-olive-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-olive-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-olive-size-0', 1, v_id, 'D'),
      ('ring-olive-size-1', 2, v_id, 'E'),
      ('ring-olive-size-2', 3, v_id, 'F'),
      ('ring-olive-size-3', 4, v_id, 'G'),
      ('ring-olive-size-4', 5, v_id, 'H'),
      ('ring-olive-size-5', 6, v_id, 'I'),
      ('ring-olive-size-6', 7, v_id, 'J'),
      ('ring-olive-size-7', 8, v_id, 'K'),
      ('ring-olive-size-8', 9, v_id, 'L'),
      ('ring-olive-size-9', 10, v_id, 'M'),
      ('ring-olive-size-10', 11, v_id, 'N'),
      ('ring-olive-size-11', 12, v_id, 'O'),
      ('ring-olive-size-12', 13, v_id, 'P'),
      ('ring-olive-size-13', 14, v_id, 'Q'),
      ('ring-olive-size-14', 15, v_id, 'R'),
      ('ring-olive-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-olive-specs',
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
    'ring-olivia',
    'Olivia',
    'Olivia - Oval 4 Claw Solitaire with Cathedral Setting and Open Trellis Gallery Engagement Ring',
    'The beautiful Olivia engagement ring is a classic 4-claw oval solitaire design with a sweeping trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-olivia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-olivia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olivia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olivia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-olivia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-olivia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-olivia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-olivia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-olivia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-olivia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-olivia-size-0', 1, v_id, 'D'),
      ('ring-olivia-size-1', 2, v_id, 'E'),
      ('ring-olivia-size-2', 3, v_id, 'F'),
      ('ring-olivia-size-3', 4, v_id, 'G'),
      ('ring-olivia-size-4', 5, v_id, 'H'),
      ('ring-olivia-size-5', 6, v_id, 'I'),
      ('ring-olivia-size-6', 7, v_id, 'J'),
      ('ring-olivia-size-7', 8, v_id, 'K'),
      ('ring-olivia-size-8', 9, v_id, 'L'),
      ('ring-olivia-size-9', 10, v_id, 'M'),
      ('ring-olivia-size-10', 11, v_id, 'N'),
      ('ring-olivia-size-11', 12, v_id, 'O'),
      ('ring-olivia-size-12', 13, v_id, 'P'),
      ('ring-olivia-size-13', 14, v_id, 'Q'),
      ('ring-olivia-size-14', 15, v_id, 'R'),
      ('ring-olivia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-olivia-specs',
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
    'ring-paige',
    'Paige',
    'Paige - Oval 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Paige is an exquisite oval solitaire engagement ring with four eagle-tipped claws, a sparkling hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-paige';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-paige-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-paige-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-paige-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-paige-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-paige-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-paige-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-paige-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-paige-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-paige-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-paige-size-0', 1, v_id, 'D'),
      ('ring-paige-size-1', 2, v_id, 'E'),
      ('ring-paige-size-2', 3, v_id, 'F'),
      ('ring-paige-size-3', 4, v_id, 'G'),
      ('ring-paige-size-4', 5, v_id, 'H'),
      ('ring-paige-size-5', 6, v_id, 'I'),
      ('ring-paige-size-6', 7, v_id, 'J'),
      ('ring-paige-size-7', 8, v_id, 'K'),
      ('ring-paige-size-8', 9, v_id, 'L'),
      ('ring-paige-size-9', 10, v_id, 'M'),
      ('ring-paige-size-10', 11, v_id, 'N'),
      ('ring-paige-size-11', 12, v_id, 'O'),
      ('ring-paige-size-12', 13, v_id, 'P'),
      ('ring-paige-size-13', 14, v_id, 'Q'),
      ('ring-paige-size-14', 15, v_id, 'R'),
      ('ring-paige-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-paige-specs',
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