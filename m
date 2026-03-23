Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1D220698
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230882; cv=none; b=le3luK0xDmBMGVuIrCtQpvq4i8SgtRA6uU/oF/a6fqQLNltp62gw9xQS1a869+DnqyHxfE81OIcttyY8JevG/pD+/TqxMu6EZjnnR4Nq2UgojlNQR6RVt6N7I8VhVlen9ZUbglgCghP+FhCJpHUqUJ1HusjlUmlKu6WMAlxIIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230882; c=relaxed/simple;
	bh=xbnlmh3BuRwGW7Lqvh/ofqvfdIvaooTvMkXqmF1U+S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipKknMjwOctS7CVOQWbwBP8ApxNXsswRJiMmDKhyuZso4u+7dyk6fYdt8aQOXBKHbDJF+OP0zmjA8ZFhwhwkxNHyQLPfLuvaKBK3AP0+b11grsNEQdzEzkx+r0EOxyCPyyhLhLxGZcvzTaVEqsXPwTTY2aH1ZtHkTkJGFXPH5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+EwXfwx; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+EwXfwx"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4159773eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230880; x=1774835680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnwwlSjzqxBbkaN2QOiq4ejjgo89iMENabtsUNWy5zQ=;
        b=G+EwXfwx9DbcqEZkXk02N1rFUqoowZvOM90xrBW0ENsoB2S+JmXNwUwuF/fOUX3ITg
         gjbnljbbGx82NwgjP/bjRQashLV3iiY4urcL2uPgCWNXw6ef5vmgHG/L+lq/Cn7OmruN
         UZ4XpwRi9a2i1NNfj1n+sN3bcfMBry8J+AIp0DwZiM5l8eJ+B/U6M3fuJ9TXanbY821K
         JnDtxiXvDkhMREYHUXYl8wN6/skt0/Cj6Qk+1xfKzq2nuYb5GjPet3jGhJefoydtFHmv
         kc7MB6WHv51ma5L+HgU61vqKqaVhR8T5JXaj3sBR3EXeOULkNwc5KUmA+FXLiSS+rJNS
         RURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230880; x=1774835680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnwwlSjzqxBbkaN2QOiq4ejjgo89iMENabtsUNWy5zQ=;
        b=IC/YZ3Mve8V+xw/ZfAHW1ePObUC1thNWFSIWpSHPE7wn4INhxUudMWT8UuhZjH1zwO
         t/PWNF/7v9nFD0OxYeZqyGsEWz089qDV+tnGkEOBzpCkcfRHPoKG9h2nDS47fg97Iu7r
         74LoHS1wYcaIiPqfih9F4F26c8OQTMDRwW+aTSGr0TTpqZbRKtTz+qivw9WPcwbe4Mj7
         pPiaxdeg/ckBI+ao6hH9LUF35bw9EsGS4b+JyD3oSMlh9fge78E8qMpU0UmfSytCyMel
         MT604/t0KD3hWAgHrG8QMq+wNT5+/U3n7MbOgpXmdJqKYori6VkpE8HuWzPollOgw/rI
         /cGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBOX20Iun/CvwWVC7X+Ri7JHr4A2pUgDfPhvPamOGAaWa+St7C5dYvrWuzPRY61ngdpKwPOUqz7xOPcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuNk3q3gnV0JXkRfm4ZFKzOC4LxC4o/fLS85NsyHLp5X9rIbp4
	q4fEvuhMYLLYhHLTGixks7OK1V3NYieHZKw49HlAt/0ELP0TkV7LG+G7
X-Gm-Gg: ATEYQzw1OhhgHQD+wA1CoOKBGh8gWjMjzcUbCAe5dkwDvKmyv1syPrMv0ncXx7a9lsf
	Nv38+BE9sxymU/H43j7x0aDZvkurLWNIDcPdDHz7W4OhScyRkUpTaDOMqW7eqSRd+BwQvByMPiz
	vuSrh6hR3VHnYtHN5vfRsbM/XSMP91kalkXxQQAlVAm51KHQ50TCy2pbRh0hmMTBXpY9qmQftyK
	4pBVXdpP8yW4XnfbkfMyAjoMY9KJmL6ptobhaJm/CJw24RwjSHMuBAzQxXfMTuWSY50JwdLS/bm
	qLzK5Yrte3pP3VB1Ly3mUkwC27wH172hpRVb0j+6Y24X8mncndvbY+IZaiQy55Dicos2sME5Guq
	bI2LDeBEJoMOQzzHiTCo28uLZTu7Vbp1U0vp+ilOf6C9SiBAXTLLuuGu0oMe5FWise/Gj1lPDHK
	SMJ0EbA17oU9HOQ4+Y0vtxmDVZwVplquncLXZx2RZgLM4RYSQpQcadCllBHluV71YVnpSw/tO6Z
	iFSfPj6WwiGoiY=
X-Received: by 2002:a05:7301:4198:b0:2c0:c415:cfd0 with SMTP id 5a478bee46e88-2c109666ba0mr4196054eec.15.1774230879729;
        Sun, 22 Mar 2026 18:54:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH net-next 01/10] net: wan: framer: switch to using
 class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:19 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-1-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: quoted-printable

In preparation to class_find_device_by_of_node() going away switch to=0D
using class_find_device_by_fwnode().=0D
=0D
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0D
---=0D
 drivers/net/wan/framer/framer-core.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/net/wan/framer/framer-core.c b/drivers/net/wan/framer/=
framer-core.c=0D
index d779b03a9e1b..77ef1bfd476c 100644=0D
--- a/drivers/net/wan/framer/framer-core.c=0D
+++ b/drivers/net/wan/framer/framer-core.c=0D
@@ -745,7 +745,7 @@ struct framer *framer_provider_simple_of_xlate(struct d=
evice *dev,=0D
 {=0D
 	struct device *target_dev;=0D
 =0D
-	target_dev =3D class_find_device_by_of_node(&framer_class, args->np);=0D
+	target_dev =3D class_find_device_by_fwnode(&framer_class, of_fwnode_handl=
e(args->np));=0D
 	if (!target_dev)=0D
 		return ERR_PTR(-ENODEV);=0D
 =0D
=0D
-- =0D
2.53.0.959.g497ff81fa9-goog=0D
=0D
