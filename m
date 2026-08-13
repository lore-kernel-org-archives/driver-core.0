Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6425147B436
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626466; cv=none; b=COpTe0Q39B3BAJVyvw28XkEf3nKHoTSb8i2prMnQhE43+DDCFR4nGNB2d9fk40rNQLyarH7MVl4A+005Mg0oFYj5nT8+W6x09DFqpPXQnKPZHGwBcead4aBJmdrwxx4AIyHQSr2SBjRUrPH0VaVqaou4KW58uTGY89E2oKR/ZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626466; c=relaxed/simple;
	bh=PgCkBg+SaqY2ck5/bBDSS+1DtbuO8coJDwswlb7aiy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYmDNqf6Tx7g9AKLZ2i6dHrus7gbAH7sOvnjeLkQyPfPw/LBYViPVLwe8oyPlCkvF2CP0/Mq4f1fNR5iyRfbQUQhC2CkUlx+CFWjXDf8cRzojt+Zdnk+ZnUCG8WuEovkCFVi39IxifOEANBp0+95ERwCmyls4/Xu9UWkCQHpK8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gjPufDXc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gjPufDXc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so10314465e9.2
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786626462; x=1787231262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMxauQa/lOA4/+kENFd3ICiTI2KeojXJKd2HkM4Rljc=;
        b=gjPufDXcGJ72yGfR0Z2AN/plKbK+9q4ecxI2WrZuI2fBnxHD3ntQylTuW/78hvKXur
         elbu7p8VsUtV7E0yEKFIgeEeQaOhVOnE5UYOgbKL38f6FhBoKpwW1xf3siTQlP66+w1n
         esUQVl5oFcgraJu3K1ESVOFAxqgCfvTZvVvX0Stf0hQRkcI2JlOjylWDKiR35ffxPXEY
         q54yt/C1BaHConNb5Tlxp91wt0afyr5a/qDpYE6qA6T2KCfY/xvVMpgmCutFvrG5EpW2
         XCb2Bk0GbfBuMzm/9d3CYzcweaoHghxEBb8WTJUs9taCNi41G2edj8NR1i6MR9RjTJh8
         1qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626463; x=1787231263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMxauQa/lOA4/+kENFd3ICiTI2KeojXJKd2HkM4Rljc=;
        b=hbngvOOpsqe4lv6UEGz4z5TfCU8iSSvxHfYtzaQZQed+tlasRgyk7mfFqMlCdlPoJd
         MjrrlLVDzBGqJROBrLyQLlhd8tT9oHJsVywGl3AmGJhX+S5B9LVhuksCeMby+YzdPb1w
         5EHyjx2bhaSiYmsofz786TEnvr9jTM8ZSd2Oxvhmi4Rlov4QJz2xkz9VPmpGwzZZ8mJL
         Z+UgBHbmNoUbaMtYInRW3Gh/1jg4VzIIltnnZsmHeWZIRQikKFTNPOn3BFCGqygmPGV/
         dMzu8rS2EGGz7kpL/iZ9xBDeJ7Um+PNU1NA0bTfoV4ysu8sPLWH3WIoDQWo1kz5yAA2P
         qkeA==
X-Forwarded-Encrypted: i=1; AHgh+RppEtVh/RXyfTHuAYjaI9zqHny6AhtWu2471eX5mT3vp1EHFaApZld6tyraCnOep1srZIVanIaHt50PZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyWmB0cHs9eT/C5O+ci/5677tkwhfhv0D0FJsODnqEtzK3lYjz
	j02TYSDRORG90srnwAgs2xmffLhCIm+PQzTBi40MVHv2AGGSIeHT0/9R7mZZHXE5wbo=
X-Gm-Gg: AR+sD13jiPm+z27ku+AkNMeGtkGnoNCAInwT7xaRDZ+9sSqkYO8r66hkjtbiwzwiCZw
	+HNRGvhXOcf8EFWQEGZuXcuou7KIs6A/8bHKT0WfJRZzH/mUKnT5doC/HRiT8uglKjcqH8o1diw
	0NZwi2kWqwlN4rFwG1EjaqNWoXOsALhqkFp7rDtr5MkPGvf70LiEAaqE5yRhLUP1vY6Jz1jKQgk
	qF4JwQWI9ADl4eYYWwXan6QLW2d4Dxfy21wRqwjzk2VL6SH6tP6qIvBI086h5HsgRplCQ80joyB
	GE2xk/zf8dsWozMkFhx/HEzZ8RQXRYfZMOUgdhE4TkoK67QqBik5XBOm923H9+VCK89mNSR0PM3
	dVwizM7nfcvAH2EdU0I1qk/9fgDpiUWFtmfBloarGrOjvCIMa1x7HBezzPXEiep8yaE90eEVNFh
	YB4p2DxSRiuDMmHiwagO2iiOLrr2n/nSCmd/Pa73pF+SF5w6m+A8t6Iws/UI+RDg==
X-Received: by 2002:a05:600c:b99:b0:499:7a5e:4c3f with SMTP id 5b1f17b1804b1-4998215a94fmr60223455e9.1.1786626462572;
        Thu, 13 Aug 2026 06:07:42 -0700 (PDT)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981abd6desm72030885e9.0.2026.08.13.06.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:07:42 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: daniel@makrotopia.org
Cc: andrew@lunn.ch,
	dakr@kernel.org,
	davem@davemloft.net,
	driver-core@lists.linux.dev,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	johannes.goede@oss.qualcomm.com,
	kuba@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	miriam.rachel.korenblit@intel.com,
	netdev@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	rafael@kernel.org,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [RFC PATCH 1/4] driver core: add device_schedule_reprobe()
Date: Thu, 13 Aug 2026 15:07:06 +0200
Message-ID: <20260813130706.238544-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anpxXANMYTlOHbPo@makrotopia.org>
References: <anpxXANMYTlOHbPo@makrotopia.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> +	queue_delayed_work(system_unbound_wq, &rp->work,
> +			   msecs_to_jiffies(delay_ms));

Please note that system_unbound_wq is deprecated. The new unbound
workqueue is system_dfl_wq.


Thanks!

