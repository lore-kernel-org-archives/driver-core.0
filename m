Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06C34CFC6
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924839; cv=none; b=pSp4dC/KpjBDaZ5I3yJeVzRXRr+i7yuZbF+2/lQ+HU7l1LSG083/NevGEL7vSOKYRcquIoLSbabkYcckRm+IVBw6OBzJ3Fb+iOjlSshnUQDFIc7VJsblQ9d4wPhEcTVbfWBohda1+gHDTydH1FjxaKCXTetLKLHU3EH2ZRSV2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924839; c=relaxed/simple;
	bh=R4LaImY/2T66WrlPaQnoTaMqE3LDAYsVdXsxUsoQMts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZzZC0hazilTPayZ1054dB4+I4D/nM284LWupfPS8BAh1aVaOTKU9dDAbTKyzJGp6neXMFtunD7cI7IFeL1itt9kusGrhRRDuG8nZTY0S8GwPeWVUzkElfV+UDbx73eJuEzS3HcT4AFDO6ZGpZsim54XN3qpiix1pDf+eMTRWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfS3EhPP; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfS3EhPP"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-456f7012050so2646662fac.0
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924836; x=1787529636; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGDW8YHqJRyxuOShb3YiQbckQHmyOYQ8jIzHmdrCgnM=;
        b=EfS3EhPP6kYRRn4HJbN//lRgQj67DnY69OmZMFsUrCEq4SZFcGDeWnzSCCWNil3rPi
         RqkHqwLG+TJ7r0YCc3XpQrGjfHt9DjcYHCNiCb8Ntw+VXavUF5TEJChVSq5Vp+LkEvTj
         QYdialRcCeZLBYtjR327pdDTBFAVdLtDteWHvoAy4LKHge+sf7mGGJcDJn6ngnv+YX6j
         Y79gOOy/sYxfTqh9aI/QJYXWTEyMu5z9e33ax3gnIf1owShLRvA8jflPAlwPQTfyMQMm
         TaTBBJAu+4ug5u/8VA7H7RBgoIIEO2vUMbXzBCfYGHv7ROnQ2RAXi/conSGdo73PjkPo
         EYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924836; x=1787529636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGDW8YHqJRyxuOShb3YiQbckQHmyOYQ8jIzHmdrCgnM=;
        b=q9+yIM5GfQdRA82/iaKTD7wG9m2oYdHqoXCzY2glp3Eu0HhyP3spqVSx459yh6mE+k
         AnnYU/UWhQOq/20JwztNNiVsR+RBrM6Gifyb28DnS5kIEwLKUzJ7cTQWXoBXycTOGdQG
         iMzB7UhYL14GvDe/eeW5scL8s011tyYcP3PTG3hfmbfYyMBs/DqnMyQdXxJwCmLtmWdp
         ba6906jTrmBjDQ/v9AwfvNIbMZwX/HgDvDtQ1nPpvDnDHu/VE5yW1HmytnjmDqSbbtq1
         144QuiUzE2Z1Dl/zoXO3VxUIShGim/WFqM6R14eIF3rS6LPN2GA4I5kQCtn6MpftHrSs
         3ucQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvjrZyeuRUPI82CQ0M7Qaw/rI7nCw4rPUOwBWMU2NC6a0b7O3Ft/TAF9zLQZpt2OQFyj1wkiXRWQU1YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzE8WgjCl1KsvK3fbOVpea5pKV99+DrdOVoj2F4ZGfcgh0rG7aw
	VgSsTjCr2eQ5FfqigHjzS+Bq2elmng54nDuHvTC0eyC/a+ktcTodNG3j
X-Gm-Gg: AR+sD10jn3/v0Ot/SD2vj6UY8u18M7Ti9nnHysEZS98rj5/rEXEJIR/wz+vlzxeXef1
	CUsWVluKfyFh8ZtdJhTYqtoVYrWKKDk0VxoYP+2vMFNh/5XgLhW8mg5ya8qOQ8WT/r7F58GeSlu
	7xsOU8MKOlGWAl12NfVLpBXBiqRQIALaXXRWohqyVzq806NM6FqsooJO/pVTn3Ebci+l8Zq0DzP
	8n2hgdEN3qhCgnblmFpAUcwk3rir20a2NWKchrAPMOIJdcLXhKCa+E1DqZ9yPcQVneAFFVvAnlz
	h4oonLjdAICuDRrISfuK9oG7ymEQF+bUetaC0nsvars8Wpo7Kvlj7d+CWwRqAcMhuzNyxjgSNub
	1GSqyPEnPxvhlXAHNYyoHF98I27hcK0CvgZhnMe4TucsZR/SDIukSsbj/9+pTusRJDljuEXXZ62
	rMEda896i35vdA+4XKIzWquZk39Cn8XYivMR/oUh1JL6Jj9PEu+8kHjk2uBagsj0QgDy8m1bcKi
	mOEM0EjEnF/ot/rO4ST/dLszfhyYLQq1U+UGTwy+o/oH/KTs5VKiyW8bnkjr9NsCOmd3ldgaLqf
	C9XHeq3mGQXZeGjBwZfdibkqrwsC3FcwJcoUzlJwsGIw0kLcLwfAO7ARrgOQk2sj7QHH6JkWOe4
	+xnI0f6mYYFCHtPUT
X-Received: by 2002:a05:6808:10ca:b0:4ab:25f0:1a8d with SMTP id 5614622812f47-4b240453a64mr13286027b6e.16.1786924836477;
        Sun, 16 Aug 2026 17:00:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:28 -0600
Subject: [PATCH net-next v2 1/4] of: property: skip links without a
 consumer node
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-1-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Supplier bindings can map a property node to the device node which
consumes the referenced resource. The remote-endpoint binding uses
of_graph_get_port_parent(), which can return NULL for a malformed graph
node without its expected parents.

of_link_property() currently passes that NULL node through to
fwnode_link_add(), which dereferences the consumer while adding the
link.

Only create the link when the binding resolved a consumer node. A
malformed graph property then creates no dependency instead of crashing
while fw_devlink parses the tree.

Fixes: f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..38c0c7dc428a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1620,7 +1620,9 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 
 			matched = true;
 			i++;
-			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+			if (con_dev_np)
+				of_link_to_phandle(con_dev_np, phandle,
+						   s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;

-- 
2.53.0

