DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-anna',
    'Anna',
    'Anna - Round 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'Anna is a classic round solitaire design with the added feature of six eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-anna';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-anna-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-anna-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-anna-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/anna/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/anna/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-anna-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-anna-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-anna-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-anna-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-anna-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-anna-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-anna-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-anna-size-0', 1, v_id, 'D'),
      ('ring-anna-size-1', 2, v_id, 'E'),
      ('ring-anna-size-2', 3, v_id, 'F'),
      ('ring-anna-size-3', 4, v_id, 'G'),
      ('ring-anna-size-4', 5, v_id, 'H'),
      ('ring-anna-size-5', 6, v_id, 'I'),
      ('ring-anna-size-6', 7, v_id, 'J'),
      ('ring-anna-size-7', 8, v_id, 'K'),
      ('ring-anna-size-8', 9, v_id, 'L'),
      ('ring-anna-size-9', 10, v_id, 'M'),
      ('ring-anna-size-10', 11, v_id, 'N'),
      ('ring-anna-size-11', 12, v_id, 'O'),
      ('ring-anna-size-12', 13, v_id, 'P'),
      ('ring-anna-size-13', 14, v_id, 'Q'),
      ('ring-anna-size-14', 15, v_id, 'R'),
      ('ring-anna-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-anna-specs',
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
    'ring-annika',
    'Annika',
    'Annika - Elongated Cushion 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Annika is a stunning 4-claw elongated cushion solitaire engagement ring complete with a hidden halo, cathedral setting and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-annika';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-annika-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annika-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annika-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annika/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annika/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-annika-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-annika-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-annika-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-annika-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annika-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-annika-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-annika-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-annika-size-0', 1, v_id, 'D'),
      ('ring-annika-size-1', 2, v_id, 'E'),
      ('ring-annika-size-2', 3, v_id, 'F'),
      ('ring-annika-size-3', 4, v_id, 'G'),
      ('ring-annika-size-4', 5, v_id, 'H'),
      ('ring-annika-size-5', 6, v_id, 'I'),
      ('ring-annika-size-6', 7, v_id, 'J'),
      ('ring-annika-size-7', 8, v_id, 'K'),
      ('ring-annika-size-8', 9, v_id, 'L'),
      ('ring-annika-size-9', 10, v_id, 'M'),
      ('ring-annika-size-10', 11, v_id, 'N'),
      ('ring-annika-size-11', 12, v_id, 'O'),
      ('ring-annika-size-12', 13, v_id, 'P'),
      ('ring-annika-size-13', 14, v_id, 'Q'),
      ('ring-annika-size-14', 15, v_id, 'R'),
      ('ring-annika-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-annika-specs',
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
    'ring-annie',
    'Annie',
    'Annie - Princess 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'The Annie engagement ring is a dazzling princess solitaire design complemented by four eagle-tipped claws, a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'princess'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-annie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-annie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-annie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/annie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/annie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-annie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-annie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-annie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-annie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-annie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-annie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-annie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-annie-size-0', 1, v_id, 'D'),
      ('ring-annie-size-1', 2, v_id, 'E'),
      ('ring-annie-size-2', 3, v_id, 'F'),
      ('ring-annie-size-3', 4, v_id, 'G'),
      ('ring-annie-size-4', 5, v_id, 'H'),
      ('ring-annie-size-5', 6, v_id, 'I'),
      ('ring-annie-size-6', 7, v_id, 'J'),
      ('ring-annie-size-7', 8, v_id, 'K'),
      ('ring-annie-size-8', 9, v_id, 'L'),
      ('ring-annie-size-9', 10, v_id, 'M'),
      ('ring-annie-size-10', 11, v_id, 'N'),
      ('ring-annie-size-11', 12, v_id, 'O'),
      ('ring-annie-size-12', 13, v_id, 'P'),
      ('ring-annie-size-13', 14, v_id, 'Q'),
      ('ring-annie-size-14', 15, v_id, 'R'),
      ('ring-annie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-annie-specs',
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
    'ring-arabella',
    'Arabella',
    'Arabella - Oval 4 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Arabella''s sweeping cathedral setting showcases an oval cut centre stone and two pear cut side stones atop a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-arabella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-arabella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arabella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-arabella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/arabella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/arabella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-arabella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-arabella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-arabella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-arabella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-arabella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-arabella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-arabella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-arabella-size-0', 1, v_id, 'D'),
      ('ring-arabella-size-1', 2, v_id, 'E'),
      ('ring-arabella-size-2', 3, v_id, 'F'),
      ('ring-arabella-size-3', 4, v_id, 'G'),
      ('ring-arabella-size-4', 5, v_id, 'H'),
      ('ring-arabella-size-5', 6, v_id, 'I'),
      ('ring-arabella-size-6', 7, v_id, 'J'),
      ('ring-arabella-size-7', 8, v_id, 'K'),
      ('ring-arabella-size-8', 9, v_id, 'L'),
      ('ring-arabella-size-9', 10, v_id, 'M'),
      ('ring-arabella-size-10', 11, v_id, 'N'),
      ('ring-arabella-size-11', 12, v_id, 'O'),
      ('ring-arabella-size-12', 13, v_id, 'P'),
      ('ring-arabella-size-13', 14, v_id, 'Q'),
      ('ring-arabella-size-14', 15, v_id, 'R'),
      ('ring-arabella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-arabella-specs',
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
    'ring-ari',
    'Ari',
    'Ari - Radiant 4 Claw Solitaire with Hidden Halo, Tapered Band and Cathedral Setting Engagement Ring',
    'Ari is an elegant radiant solitaire design with a beautiful cathedral setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ari';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ari-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ari-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ari-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ari/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ari/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ari-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ari-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ari-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ari-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ari-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ari-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ari-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ari-size-0', 1, v_id, 'D'),
      ('ring-ari-size-1', 2, v_id, 'E'),
      ('ring-ari-size-2', 3, v_id, 'F'),
      ('ring-ari-size-3', 4, v_id, 'G'),
      ('ring-ari-size-4', 5, v_id, 'H'),
      ('ring-ari-size-5', 6, v_id, 'I'),
      ('ring-ari-size-6', 7, v_id, 'J'),
      ('ring-ari-size-7', 8, v_id, 'K'),
      ('ring-ari-size-8', 9, v_id, 'L'),
      ('ring-ari-size-9', 10, v_id, 'M'),
      ('ring-ari-size-10', 11, v_id, 'N'),
      ('ring-ari-size-11', 12, v_id, 'O'),
      ('ring-ari-size-12', 13, v_id, 'P'),
      ('ring-ari-size-13', 14, v_id, 'Q'),
      ('ring-ari-size-14', 15, v_id, 'R'),
      ('ring-ari-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ari-specs',
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