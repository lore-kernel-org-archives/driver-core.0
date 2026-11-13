Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583380;
	b=EKdNAbjE+vNN78q/RR6Z2ZDIU81kcchdq2U3dqIFE8raE21rocvyz7AngYh4xlN2bBXr
	 avMgUing4tZjCFTAa6HR0K/Q1SJOHKeTC4dUQL28ZzSQWiyTQW7Gzh5gyenQPZPv1hJRS
	 BOwWu0/bDMxIXZqARf5e9aNldnFDqcCb6B65Fu7MfTEPSz6o4S57Qdu6Zf+UFcLv8QLsf
	 UpFoppycgkIVhh5Mln7uHC3e4s2e9Bcb0npqns4r6Fkh2O7EM/G3gg4qFI2E58yjF4xxp
	 EwCySkV3FDYd85dhFxB8IQo79frStOT/bojuVGcxSnGzKD3aJD20Z1ySZRQ/kiAvsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
	b=s4EwcQkegAVGbNlx3tbX6KrueCzcG8/8hgX8ozRV8/pIp0i/Rdj+TstWrb+uMHSxCEJt
	 aGAp/D0UxnwhybjWTOoMKhVy5dap/uTujDpzu4aTICqjUw058h1TTAzY84FfgBpQIHkhT
	 ry8nHULRanW3J41H/U4e86IjKr41tQDf2p65Jt0kR6W6d4WSH5vUsuLaVC9kKHCGYRkc3
	 aKZJt5kMXQ61i5FWvU3kMc75I5ETf8wkScoXhn4XiRNGz8+uvPQcZQRB+cUtBX4Bo4KhQ
	 iJjbMA1BCds2WjGKQx4DEdK2mcAiH9SacGMXzZM5KnxBbKcOopPO+yQGKAuDwWtNESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idz+TH8l;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAA606A332
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEAA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=idz+TH8l
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so17841085e9.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794583378; x=1795188178; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=idz+TH8lm30MnVgVYDXMwAWbHphFS4J0l2xiVf4llPpXvhBBnv2OlWeFTQCykJTN/I
         nL5KZ4vEwVXPb0jnhnucMh+tSPGPLUkJXSiv2FsyB4YAeZiy05ng0C6WjT/AkmauajF4
         ZSTK5PZV971Qd4GsFtBtwtzTSXygExxKmWG7D5gd+u1JENj3bu1cZfN3zGzdxk0tNzjv
         iJX7YnBGwc4T4GLX4OoZ+8gkEpg7pNtzsNet6Psium9+Vu0o/ws2p5vCxqoUEmEUS2xM
         K8FM7U2z8lLu3nfuzlTOcRA/rYXaA0gQiCdQKEWbVEn2NpJOfP5qmD+OssNMmpW7Nmpm
         YiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583378; x=1795188178;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=15C1MztrjNKefuHHEqlV5Z1AkTngf8CEjx5CNcH9+eYGNu1qkDx54ln6c3ZLAbwtuy
         Ircx/75J8cZHvtv/wUPPH2Q2RJVrVTXL/ZXhnA+YspA0W1R17CcejKrvBzpYXCAIGdFG
         ZaYMlzWBZOizCgktN4KkHJhFjWCE5zQMBSBd837mxLYGoLqBqTa/ZQaCWRfO3LX7hQI3
         n/skbh+NE/he6a+4nR/e51GOambYI+1ku5pN+UJ9Rm/iAfhJPh213JZXxBC0aZCbPdqS
         DFd3rI0f23EFGgbmhcxuX26r8V+tFRKc1ab3haFDZiAFTxGHVaY92zNVSg8BajN1eKD8
         WJGw==
X-Forwarded-Encrypted: i=1; AL+hErHYyT4AJVQqVE/5cZyhQFf8VN5kLZPRHlyIROv4KNB95CS/gyeRC3ZBtoPrgMFLwGqeiUJkghZOZTa+Cg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9hw1dmN57ugc/f1O4s81brz1M1lGagVyoXI0++OUPzS1CclSsU
	7AlVaTNDRgZPdPzx1vXxkVvVRp7Hh8l2Ai8gLXWVpzsWuODt/+F5QDU9BYqqi+s+SPU=
X-Gm-Gg: AYBFou0AJMLVm6EovUIh4CgIxu2NoQiPfNrOlBxCM+4iAckpFPJZHFhRO8NYC014ASo
	Pq+8CCYXPYJpzhd3FHH6JFMVNSFrw/HJH95qR83mGp0Zm6PX+0Ms7PUYirs4lM2vQCDsufcPJIv
	T1SicGJRmTI4P/S59C3Er8dozlBKDH3UTLLVT4uLw0Bgef0XoGFmIoD1QXDWkQv83a4+da7p9Ea
	0OvqGYDfRY56s0NJbkBhB+WmTYCPN7Mw9wja5EcOaJocBCkJNz/6XRYBcTa6HPuol0Z7veWNGhV
	611oQu98vTJVl3w2o+RELOudpbjHIgx0w97DYLF/fNrOM3mS/ThXDz+iHaPefZGeDO8yRyXVRup
	lOBpn5oUQIVlOKBSoqC24hYBYIDKX+ezk+CelzZnMjs9NEdkmJsb4iUar8H+4AkDsN+kJNR2h5+
	5k1Grv9fJmUj3a+lPVVIhpCEEbmPDBuhYfm8mPL9iU+AojWFSGS8HVWyCZlt9+1ytdTWF7zmXtv
	coaQEUCVeo393fvSS+6D7DLLW9RNV0QnLNCHxHfnOR8fIxDQItfm1yqQp4jPoO7/UmMyz8NFLsV
	V+b4Gk6ZOVrhoO6ylB69Oh/WPmcb/iMlvcMoGXjAlF+T29Qs
X-Received: by 2002:a05:600c:470a:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4bb55a44996mr54909955e9.11.1794583378164;
        Fri, 13 Nov 2026 07:22:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm169848395e9.2.2026.11.13.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:22:57 -0800 (PST)
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
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
 devicetree@vger.kernel.org
In-Reply-To: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:22:56 +0100
Message-Id: <179458337623.3308909.8679910347462508471.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n9gjeLxQD41dq62t9Q1UDoH8EzTxjE0oy5fasIAenSY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnftQNYFjZnu9ws4l/TOn1RRddMPbttkjGdaTOj796rf
 TLVYhFvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiVMDI0GWS98twnrmegNbD
 XZYWZY3fVXqXcW6esoxPSy1QcfHdMEaGC//MfS5kr/0fcIBJuSN16412sdN5/5b/Mpj7ZUnLzj5
 3PgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> >>> Preparing a clock protects its current requirements, not the resources
> >>> needed while changing its rate or parent. A transition can temporarily
> >>> use both parents or access an unprepared clock, and a parent rate change
> >>> can cause other clocks to be programmed too. Raising resources one clock
> >>> at a time leaves those operations exposed to insufficient power.
> >>>
> >>> Failures make this worse: hardware may already have changed when the
> >>> operation returns an error. A matching cached rate is then not proof
> >>> that resource reconciliation finished. Retaining a temporary enable
> >>> reference without a corresponding prepare reference also breaks a
> >>> consumer's normal disable/unprepare sequence after a failed reparent.
> >>>
> >>> Make CCF acquire the affected tree's and parent paths' resources before
> >>> notifiers or programming, and reconcile them only when the walk stops.
> >>> Keep fault recovery independent of rate shortcuts and subsequent
> >>> consumer reference-count changes. Require explicit recovery of an
> >>> ancestor's uncertain parent selection rather than reporting success
> >>> from a descendant request.
> >>
> >> I don't think all this is necessary to address the problem described
> >> here and in the cover letter.
> >>
> >> IMO a new provider API is the wrong layer. The framework already has
> >> the hook a provider needs: the rate change notifiers. What the core
> >> should do instead is fix those notifiers, which do have a few issues.
> >> You are fixing one in patch 1. Another fix, about setting the parent,
> >> was sent recently:
> >>
> >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> >>
> >> You want to act on some changes before anything is programmed. PRE
> >> notifiers are the right tool for this. The user of this change in
> >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> >> it, ABORT drops it.
> >>
> >> Also, what is acquired here follows the requested clock. When an
> >> ancestor switches parent, the chain of its new parent is not acquired,
> >> although it feeds the whole subtree after the switch.
> >>
> >> With notifiers, the parent fault state is not needed either. As it is,
> >> it blocks every request on or below the clock until the same switch is
> >> retried.
> >>
> >> Could you tell me what you need from this approach that cannot be done
> >> with (fixed) notifiers?
> > 
> > I'm a little worried about the ordering there, since some device
> > drivers may also be registering listeners in parallel, so we don't
> > get a clean split of what PRE means ("has power for sure " or "may
> > not have power")
> 
> Do you have any thoughts on this? I'd like to proceed with this
> series in one way or another.

As I have replied before, if there are things to fix in notifiers, we surely
can discuss it but, at the moment, I don't think the complexity of what you
are proposing here is justified.

Please allow some time for Brian to have a look.

-- 
Jerome

