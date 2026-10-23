Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751719;
	b=yun7Xl1L+X8+bowvALhVgDg5oLdUPTJbVm5eyEH6VQ5ITOFfabBDz7h0L6hN+sEEyDfk
	 XT2eMiATL4D9smJ9qRFzX0SheTXa2m+xqvNOw4lvkdwxUTtK/FDAT3X4TPTK1Ts1K/8/a
	 dM6qFPfXlZwu3iaicyU3pCh7WXFR61omalx+DpYtwjxxQq3bflifcbwikaShgQR3Mm7Jc
	 QgPZRkaImXXt6uRzRdEqxv80PhcYYEItAcOD/e7Zwz+sVKnpyW6G4JifwHDB/spbXx01S
	 PTg1UxcX94NBaAowwhRp1B66uExrZO1MP5f32C9b4pGq8hzLFVjk+b/vwO8WqUTMpgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
	b=Byrey+ZwWn2WJXiso4fFZhrUwiBRdIfANum8+BDIl7Fv08MmNlCnzCqz3rnN/2s5UTxw
	 3pm7DYigHHSGGdZo0v22EZ8x+weLh2zukdg5Jku2HXko6svqdGBZyifrPcZJq7Q6MGpbP
	 b9kX2CTnUoGBi0Zf9ZTKu2+kglxw+syUqq6QJJQhyUtnaECpTTAKKvAUweWzkkWhgu9fc
	 v6u0xLjdqhQPvlZgZ9oUzFjJ87wc0rGyeY4sItQm3oz2PauJueoJZD3Drw0VcMxQZAGS6
	 UkjQVUsBsTJ3v3Lu4pU2KwwStEErrEOsYWMVtL6xJy6waJ+o5t/0y1npWEU+HF4dXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033160A2617
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9033160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0759so482094f8f.2
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751712; x=1793356512; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=VCmwsBdPJ+glPdEHyqvfnY9pSaTtrqqkC+dHxJPZQo89FOpszv67ven50ibImWVm13
         RB8IFr9HsUVs9JUaymJk5GokPK4pSnmL0dNU9IzMIx74BJ4q4bGoYoRWjzM9hahZMvGo
         /H98QxEO+sUeRSk2QGaFRvac+sZ/2PooZNan7CrQbU35VnGN4OAlOjE1aHHhuYR3aNV9
         EGjBFR33gh1t5/2/qnuF4FR6QHdH4EwneYQ7Uyuq4TQFFw/4tc0tHv7Ndebkqy7UBxDI
         o49gqQF+4m7EqE4c9D6Dwep65HjjuWtDCnR/CeX93BbhIwV1+LTxg3xciLrraSHVJg1D
         +Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751712; x=1793356512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=obt5lBLfZGcoAiSbNtsk+5qz4tpfZjcHdWLm0onRCS7uxGhWPCZJU/vYU0x3p98gCq
         dQhvYJ21zyaEVEkdy7MI/wT6/O4EEMLjPPMsLlbC9Ol7Z9cQ7F+EVKpwGPmx2GR7RiTz
         CsFznBbR91bLN9I/MXb/naNvP1e8m1i6pDakxqWUkD5Oc0njm0M8zyd1DvjPJP84Bm7W
         jrKmPh0Th9HdHQdrBhHS6ZswP4d9SI3l1DOi78LzdvDF0AXbjFg7nXLThlPw1LJYuheS
         FJs7ZqPS1klZ8GH3byzj2J3C9hK+wceQ+g/U/gzNJ94z7hnpbPR6m7J7Ua8OPYmbt+LE
         stdA==
X-Forwarded-Encrypted: i=1; AKwUvByuSZFQmdCrdAgazlUx5hmEvbe8iTqJT5TwOCbDv0GSU8NVSxXrYxJX/dP02oFiMHfccge92nBRNlDMrw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKWSMvwwL1EVV+63vWej2KHYxAGUe/t8jfr28sDAF6NT8h21nQM
	kP98PZTifzUB/N4a4bjxPcPg4/MKTA5aYeqTmUoDUfsDbJ+CyRk6rDluj8/ui6UZPOA=
X-Gm-Gg: AYBFou3YG/BXasjjgXFYWGvzWSfTWd2mgs46TDTPf3mqdFBxnbP6W18QvSIFjNARZ9y
	55WB7EJaeHA1U6quv5hiSjJdRV+bH8O98huUZ8X0PCgBKoB8u3qiYKQPKEjesdsWVyjfxesTl8G
	MIA0Sfr52NmNpaI0MyT/HGtGG3XKuQYV4WSg//uDsuiYQPUTyFr1WNeV7aKO8h1nSbeJHOEeNWD
	43NRFKrRtgri82UV+bXBjVUwEbj5Mhs8eEjK2FGPkvr78gmm9HG7DNeqHBKUv2ptGZDJWZG/gMn
	1NhVIqW1F2YAZfldjJYVG/d1Qm598lH9evKbbdNq4jpjAW/r/DGZcLGwX64O1mbSD/bPfxHiC4S
	wTrNkHa6+SXv4AWBWpiEB8EMFuAMakMDeQf5YcL4PrwVDhrxgvwf/8a6Mdky1uNr/CEjwpC0PlN
	wWRzyb3xqr0sPM/yH6odbXm9nRDjZ/coAgD66LrwLB26GEcJnTj4msWnc8b8QEZaEXPscH8trYx
	SyRSSfAHM3zE0fLn96DVOWwIEjljpyfmDPt+lu9RUJPu0g6GUECU0QElz6zoeEfu1NS9TRXvdY=
X-Received: by 2002:a05:6000:4916:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e38595e5bmr2679426f8f.23.1792751711919;
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm4713525f8f.8.2026.10.23.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.11650113664838519061.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dNgQAFqyGnVxmM7oecHvQ23reWhdI9mPMjanH5L2B3M=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaJkUwN+3WXTmhS0Wn1LV8+H60VT70se+bvq/c/mj
 X9XzNSO6yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE8tYxMpwu5GVlv+ARel/H
 l4mrmS0wQetMf0lT0c80eYtlV0OENRgZLlT8mjPF1ViKdcu9H62FN3cvnnFj228+iQvsp3ccXsR
 nxw8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Preparing a clock protects its current requirements, not the resources
> needed while changing its rate or parent. A transition can temporarily
> use both parents or access an unprepared clock, and a parent rate change
> can cause other clocks to be programmed too. Raising resources one clock
> at a time leaves those operations exposed to insufficient power.
> 
> Failures make this worse: hardware may already have changed when the
> operation returns an error. A matching cached rate is then not proof
> that resource reconciliation finished. Retaining a temporary enable
> reference without a corresponding prepare reference also breaks a
> consumer's normal disable/unprepare sequence after a failed reparent.
> 
> Make CCF acquire the affected tree's and parent paths' resources before
> notifiers or programming, and reconcile them only when the walk stops.
> Keep fault recovery independent of rate shortcuts and subsequent
> consumer reference-count changes. Require explicit recovery of an
> ancestor's uncertain parent selection rather than reporting success
> from a descendant request.

I don't think all this is necessary to address the problem described
here and in the cover letter.

IMO a new provider API is the wrong layer. The framework already has
the hook a provider needs: the rate change notifiers. What the core
should do instead is fix those notifiers, which do have a few issues.
You are fixing one in patch 1. Another fix, about setting the parent,
was sent recently:

https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/

You want to act on some changes before anything is programmed. PRE
notifiers are the right tool for this. The user of this change in
patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
it, ABORT drops it.

Also, what is acquired here follows the requested clock. When an
ancestor switches parent, the chain of its new parent is not acquired,
although it feeds the whole subtree after the switch.

With notifiers, the parent fault state is not needed either. As it is,
it blocks every request on or below the clock until the same switch is
retried.

Could you tell me what you need from this approach that cannot be done
with (fixed) notifiers?

-- 
Jerome

