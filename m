Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234913;
	b=VqBUde0//XE13kh7sv16ssxovmspZ+LXfe8/yVXvV77V+1zp5+dtTmYD2T8ozqt+jnx5
	 7V/DlgXyD9J3q4ScWrlzg9BJdKmw4k0ufNSQ/OvQX8yjDF0lDRMCn1wggUd9b7EFKSfz0
	 ZZXkP2lq5F0zc7V3T8iUWdkc1yLn6++8FICdnpikJD7DLifw5Xx4YhlchscbqFWM671th
	 /vP2WKiMMitOrBmrJzfL4OOYqjqc+Q/kClM0szDigpP3zS2rjVvIm3sH+VhgMjTomwvID
	 mP+/IMif295FtCIhp2PLu0rU1jMF7XyTlsHlE42adcwaJAvI//GY0NuFfoTpWyDlpsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
	b=xcamY+hWJhiCXpoQAhslQfugMvLCyY1UcAJXCbdkVJWf6pl26f0qWZUv0gnJnzYWVMb4
	 XT1U60h6nd5DKm9Gq0kvNYzGuMu6CDtuHXUUoQkn0nNXSL8sEaoeW0E5PyshV//ShEHVy
	 D4wcl5eRQIRry+DtF4d78kAnBhrp75t+Aeiy1Mg6Ft7AD/DJgIPb+bldSJklqf8CbuYNn
	 AIjpy9/vskV5WKC7geZeAsSunaR4UoHi/L9lyiX/e22QS7aIC4kBmmAxhSzUwVmqGZMuW
	 qjVbEJyxWgs8Scy8pT2Im5U3/zel2M9LDz902vGJMCkHyDNutNDIhW6yJRsDNegSrKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ltTj4hpz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BD606A321
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 14:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ltTj4hpz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491aaed7565so582659f8f.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794234911; x=1794839711; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=ltTj4hpz/z9VWT+o+A/p/V9p1ZUS7yo4LRdWXVIOkp1bARfxsrd8mlRYwoW9Mry6C1
         sD2alWRJvH5KR4Fyez1q2Bu6ZlNGasK/dsDgC+hsPJSdixbgn2NDq3bUfS7hcgQdDAbq
         bE2BdC80niyEduxM4+SnZhmgie8R4GT+7IIkOoYp9Wk9aO4Wn7nF9h6tICMd2AqxCPz1
         56xSSE+DP2EGhVwERdFmH9tvJyS1LK+LPum/5r7KCjAFz27phCkMT6zxybCVR5SA+myL
         qiHfgHqUEY05BtO3PJjv8P/1ZNjXtRZLYOv3CeNW5oFTQOjINl63p9kstKUR44G2Hh0X
         0c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234911; x=1794839711;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw+eBPIvZaZja54P+QZeBlOnpeJKHsecGlfu2oePjkk=;
        b=zlSRLR0lQIAmV43dMy/nvGnNUKe4VH5BrfQOoCfwwlE2j9pf0fdWC78dfjJAFADP+Y
         70r4S101FheFMVqUQUCtDmZ6/EoPoxLex+bG32+eTuF9f1i+N4JWMpCd1CFmXsrpX8Zm
         UIY/K4JAilzdJaL6mlCs2hdHFQhvtsOCjLV41ujw+LQQoSUgvf9wF8ew0LVWYoLLZkmO
         7U+fa2bsR7ia9xdq+LE3yvhVvpgoMfa1kIWHywN0cZjKOzF7p4EM2iKkOobd6i9F3giQ
         sxriY+ZnIHw+XI/o3Ut71AvGHTSeV1NkrGZ/RiJtD4L1eEVrNy1mgKd7wohCv3RMGrOR
         Bopw==
X-Forwarded-Encrypted: i=1; AL+hErFHWCvkHd6Et4hupK/I84iUdnPov4+dtMgYwjrM+Ao/f3eTBowC1z6XUreGzQCU0Z7Be6FlWg3irC51AQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+8YzriTiNA7TJdOd2O5YmlsJ0Zs7L/BLECKb/ccED60vQKX9Hw
	+jdopRxcUpjkIqJm/0w0bhzkloz3zK0GpvvnNaOdsOnhIlYDgX7xfvEVEqnqV8GKXqM=
X-Gm-Gg: AYBFou1w6NOsNwA798h/Kw/m9JyvLjungOo+f+WaiPSYW/d1viFkg+PgBh5UfvqWtCB
	fXge0Y4vKhYTK1fWbICdbdSS0jduQomY0BGZe0YJkOqBvraNJ7Hh8Jx6rXBNeJKx/77rdQ+0Amu
	kLWp/5WvnbQNgHBb6dfkDM/tre88pI1HAbv5Zypy8kfXk1Fge4kNdIs/STqJWA+bQtvAfwdTH6g
	v+1er+wC7h3DxoL3rfh6glH+8R3YllkGNLZ1GnnWYwUEgAv/XIq+19pfrmj+0OO9ebxjdOb4yoq
	tvZbLWGt+H7WX5NDusfRvec9TNDq6Fne3kO/nU3JCr2zV/iWGJUPqugoooHsH9wSogHsAJKQtGv
	QGufCioT0Tw3KSWtmr2gp3jYiGJpragqRJ0U5+4Lxh8bK1JFBtcwpnCVcNVKCl8xSlCFq5xr7KX
	6I5YjBplO1UNfS29CiuhozIRqjqDikNmwvUqvnohYSsa1NCp9GI7STPsuMvmBfFEGetjvGPUixE
	2Nm1oNZkJAzzYvWFUflUgveZMhphnEF4FCIr5yzeODNE10nJWmQ9fPEEaSRr3cdRqKglDW6h+nN
	R43kEUaKeFQO5xNll13+rt0isaASE2bb4sX/ADdnB73tn+TZWLCrh9JvyJp2BCtc
X-Received: by 2002:a05:6000:26c8:b0:48f:bcbf:26fc with SMTP id ffacd0b85a97d-49584b5ac5bmr9070341f8f.53.1794234910753;
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49596acf465sm11956132f8f.21.2026.11.09.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:35:10 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/4] clk: implement sync_state support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Date: Mon, 09 Nov 2026 15:32:58 +0100
Message-Id: <179423477880.2972505.2645503913422176960.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=o4Xgpkdj9rBV0TT6F77aSGItRKN6wTWMv6prG5GBA7U=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBq8dmgv+aOX66nSDEDsF1k1CaSV+jhqW7LubaPd
 5rQ0zILw9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCavHZoAAKCRArRkmdfjHU
 RbxyD/9BeZoYQ4glcyQ/Fg268/AgxasdvPsVvllWI3o5uLYKBhg3Z+qIak14twdrnOqq9R7S7hL
 +4XDMf1PIzcmSxB/1XQZHmhM/pB9eLrQ/zmcOBUpLfi1rSBbw0eC3FFNwrYhNM/bu4jdBOcMT/Z
 JApjWL8WuHRz3YvSMcKCsK7I8KBS+Jzx0Vp/wmy05oV8M25wMMk4k3EssKdyYG75DpuMPbT/8ko
 zI0i5oA0YnGoGMbQPti3J1ZyASFtVExnTtK10BvaNq7f8nUmmU4rcpaTFYXo3i8xhVhMkqfkDFR
 ReRNla5mwL3nQCFr+FhvtVLZYjG7zQ9MyN5WAmDzsCwNPuWP0MeE09fiVLiA8PR1qc802csWyDw
 4OUZ937h+jK86x4qGRJOPyx20Euu7W+3Afbuxr9fI/izX5vMKRE2WGIoiAkEptjzoOtW0CzkdYn
 +YjD8x3Ej/Q+gb/qWDeKfLGvIWlMtRjgPhYg5DyQwAzBwixzZiLRtvSLQoMo/z2w/SOdAP/5K32
 2gq6DA0l5znKFTpiFZTZ8ivE1wmFhka3+NtPV1deahwLmTwVPwDl+g6Jbdyk74vNSWJdSz16JIU
 h5RO23/M7pKwh/LDwcCoGLxcld6EFLxNx71D97haH/yuJjw9T3i0GmurktbnjEAJeTEMVe9daJf
 cbYC6Hvp8QrPY9Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.

Hi Brian,

Tested on an MT8196 board with the GPU enabled: with the series, the
MFG PLLs are swept once their consumer has probed, which let me drop
two local workarounds (mfg_eb marked critical and a parent enable in
the unprepare sweep).

Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
