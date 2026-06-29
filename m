Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6343D4F4
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748102; cv=none; b=DqXXofE2f7K+ewFZekQ6dOtwiCkkRaKQUvWlIu6jz/6rMyEfGLh+cex+q1gXX3oGtzx3XyQWU5G/86rg21klKqk/iwHVmgjMxIJOAGA3IiBP06WuyWEy7Pf/jmGNCBes4NyKUvymx9y2+JdUfksZnKnFMwgyenCjuM1AuQdVwkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748102; c=relaxed/simple;
	bh=xEj2dKDGeASR+fSR2Rl0OKNkvS5xk75qjuIZf3NSAJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E283hzIPI17VQdxC1pNZ+BfCdQJ7KQE+af3UKeTdva0LwQxhflTH5pB8CCAaWKTQftUZd6n0GB4l1KQnlu1vcYDQdIbfuYeEtN/br7/TiMV7z1oNYYjGCJN1DdhMO85N2HWnusuEoMidfT68EwlnEEmxPLRUDQFb8524i48a1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WiCoE1eY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WiCoE1eY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782748098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qsO792Ztaa0qn5nI0kJBMOa5Ndy7BivqDU0OQn0EDk=;
	b=WiCoE1eY+yFPoOy0R43vseCayOrwtxmVubD//9VknXIbppzE6LoCbTpNgCY3B+x07okV1j
	QdGdofyC2fbumE9wZaG5cSciiRpM2VhXKbHb3+QcTo3P6k5uMJOb5ILibXqarqI9i9FTIu
	hZsEgsg0izzF11PolEen1fzexbdNnJ0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-_QZB4aAFOKeeLt_L3__szw-1; Mon, 29 Jun 2026 11:48:17 -0400
X-MC-Unique: _QZB4aAFOKeeLt_L3__szw-1
X-Mimecast-MFC-AGG-ID: _QZB4aAFOKeeLt_L3__szw_1782748097
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92da6f3cc81so451002285a.2
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 08:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748097; x=1783352897;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qsO792Ztaa0qn5nI0kJBMOa5Ndy7BivqDU0OQn0EDk=;
        b=fOyQYHVo01EcSbp1isVPDj3sqA+Nmq4pB/4dDZd3TCyVcpVazrbkRHQ3Um+vBv59Gs
         zELVjN0WV05EPmX0shNjUxfObg0+T8WFbyZ461+kTGg5betTM4z1kqCaH/GWW/7isp40
         kGZUE0ctg3rNifqwKmJZeKLOatxXgj2ocOE23FmihAYlXvbnzxzKuzdwrMFSJCw3PoVK
         aOJSoWsFXwodpsLq+DDTbTL93BfGNXV1qU1oE+BB1YrVYm/fK/6doTUfq1rjZ//WZxRd
         kcbLPSEiXi//qJfavHMWCD6iw9xLusDCQBhCMOG7elwDqfUqvFL3iSZcSOgS09i3CpfT
         Ht2g==
X-Forwarded-Encrypted: i=1; AFNElJ/p1TKU8xSldygR81+Pbv53GY4ow2D3EVxkjxtyKhOcVyRr677Ze3NosezxU4rbrYsAN1dUNpslhbRWiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKM3sg3Soc3KXmhweltYebN0umXx9wezgwheiyx9HU3iim6U9k
	i5tU9/cTC+pgQ3gUQ2h9EzzMmOixh4vKw+mwbfuQph0quwzsblojIQk9E8lqknRFLU1Dcb8gnim
	RoYMYrJOBFuQbJHDCBSP5LQbXPkQqZFVsMmEEybTFXMBvCbqnmc4qFXyO4udUWNN2
X-Gm-Gg: AfdE7cn1IgTCGJkBh/LucWG41vtWCVc0tPpCoIyItU102/M0ZW9HM7XKvokAlO2tQou
	u1yo6dNoGtIjI/0nlhyLry5v5vM9SermsfkhbIqazhJYAs6hXUTtzrjGGLYgtFhqA1+U4j8dg4Y
	2nCxiv7oUP9QrZMfgIuTzRx5UBAX3xjgtIckQEjRPfW71S2gueOq88EMUTBL/I4Yaq2EenciHtd
	cTNpq7nr6m8SLCw3vEq2z0GVn7W5e458anZq/ULxI2RQ+g6J9fManHoZNdvqAnotW/l1ZDm4Lzx
	kvTWW+bIRjb/edYwmVrDa5ml0jXZFqHwYitIpiId3CI4pNpu/4vQie1wzQXMTbsNvJAo8x8NGb0
	SsLl0gZ1AykUwh4Mhv55J+AZopSRlqg0dIgbl0u0Spaoipw==
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr13877585a.59.1782748096879;
        Mon, 29 Jun 2026 08:48:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr13870385a.59.1782748096281;
        Mon, 29 Jun 2026 08:48:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c283fsm947266d6.26.2026.06.29.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:48:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:48:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: implement sync_state support
Message-ID: <akKTviIP_rt4eRSk@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
 <f280150f-f829-4425-a856-9ca9f7aca233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f280150f-f829-4425-a856-9ca9f7aca233@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yLFo-aQThp_EV0tULmOjECqYWk2SenaUm2oaYfWpTS8_1782748097
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2026 at 03:44:26PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > The existing support for disabling unused clks runs in the late initcall
> > stage, and it has been known for a long time that this is broken since
> > it runs too early in the boot up process. It doesn't work for kernel
> > modules, and it also doesn't work if all of the consumers haven't fully
> > probed yet. Folks have long recommended to boot certain platforms with
> > clk_ignore_unused to work around issues with disabling unused clks.
> 
> [...]
> 
> >     [    0.366737] clk: Disabling unused clocks not associated with a device
> >     [    0.367232] PM: genpd: Disabling unused power domains
> >     [    7.791413] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
> >     [    7.799702] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
> >     [    8.548820] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
> >     [    9.121849] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
> >     [    9.121985] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
> >     [    9.122691] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
> 
> Many of these drivers only register fixed "virtual" clocks that
> don't lead to any registers being altered and only exist to convey
> what the clocks look like on the hw level.. but I don't think we
> have great infra to skip that..
> 
> >     [    9.122760] disp_cc-sc8280xp af00000.clock-controller: clk: Disabling unused clocks
> >     [    9.142121] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
> >     [    9.169149] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
> >     [   16.057997] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
> >     [   16.058149] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
> >     [   16.334879] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
> >     [   16.706113] camcc-sc8280xp ad00000.clock-controller: clk: Disabling unused clocks
> >     [   21.565731] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
> >     [   21.597069] va_macro 3370000.codec: clk: Disabling unused clocks
> >     [   21.605039] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
> >     [   21.630313] wsa_macro 3240000.codec: clk: Disabling unused clocks
> >     [   21.635069] tx_macro 3220000.txmacro: clk: Disabling unused clocks
> 
> This is a bit noisy, but then it's necessary for debugging the
> related hangs. Maybe if it turns out to be a huge issue, we can
> hide it behind a _dbg() in the future.

Agreed. Personally I think we have this go in with dev_info() initially,
then after it's been there for one release, move it to dev_dbg().

> I was hoping/expecting that sync_state would completely replace the
> late initcall (which would also simplify this diff), but I'm surprised
> to learn that there's a whole bunch of clk_register(dev=NULL)
> calls in the kernel (are most of them doing it for no good reason
> by chance?)

Yes, correct there are a ton of clk drivers that use
clk_register(dev=NULL) to register clks from __init early in the boot.
My understanding of one use case is that this is needed to setup arch
timers that have a dependency on a clock.

My understanding is that lots of drivers that register clks in __init
don't need to do it from there.

Brian

