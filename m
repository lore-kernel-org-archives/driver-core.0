Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DE416D11
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747083; cv=none; b=mDKswgaXOSlphH7d0zG8jd9Q3cM8B13qMRRZbJCNzgfi8i/0XFdEBFiZEIEqNNzWAAcH9jQxhwtmzDIKbAkKmofb8sceCCWdHe7pCm7yv175aqkEKBx/8kxSIjN673Qy7W155q+4mSm5hMqFMIMXQiGq/QtLDChXfn6uwCDZHkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747083; c=relaxed/simple;
	bh=TelLuQFVj84dg15intj6l6XA0Pbbdt2xzy2TuA9iVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Q2CEYSbzzi+v4Kci2GjNMq4dME66u81leYo7EDxQAghgNSyMKcrV7aCx1FDKpxWJcyuQLK0cS4cCptyaPLSNab/47YAp5dadXMf7285iKgEI0inv/bl4rld1ASWyT+uNWpl5hkN4Gx4sCiodGPQX6LSExyNImhzf4LEv1JLHZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gY4MbajB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gY4MbajB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782747079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
	b=gY4MbajBgHoeSL+yJ56ST37WLcwiW4st37dCYU8K8pOXU4HCM40oGC9tW8+JMbnt+9npFG
	uvzhB1yXFBW79d5jwhzWycSnyrsjxZclgOIspa+TTqkgVCLIDg6Sw01jazN3H2yOpC7uX2
	ds3x52jbXhWOLE8CpphfGcNWzZmPG2o=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-wv_ecvU1NLmgSGwoCyhg3w-1; Mon, 29 Jun 2026 11:31:17 -0400
X-MC-Unique: wv_ecvU1NLmgSGwoCyhg3w-1
X-Mimecast-MFC-AGG-ID: wv_ecvU1NLmgSGwoCyhg3w_1782747077
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf38c83e1so26056731cf.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747077; x=1783351877;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
        b=CxBtUKGGkTT/2MU2l9kPYDGaTWt9TbjMc9kNHcZwXuej5NhIqzT3QwMyi9RB0EVUo+
         LL9xFgIdndtkxfGVlLUphZ7+jFXeRLMHibw3NTi2d+Aml4+vYvhzVVyjVic1xt9baVub
         VrH/KYutjF2Zq9xYTrdbxd+bU4yEJV79NqMCzg1fJ+HteZxPI6Z1B6CTpGdDm3Ul664S
         IA3Pk8cGeBywKwgPXqP20YDaKBSWA+vEmdqKQ8D0CeXn4+9NfmgbNMK2bUjd170O1DgP
         I5AW9rgxCmTCVw6r63R5K6ayfdK7BtDO8oisLjoe0ajOTJm8B6yZCpLkGAOSi/SDfJZa
         qlYA==
X-Forwarded-Encrypted: i=1; AFNElJ+PpAtY2+aRDQmPlA8eJJf7fFcvbNrjuiecH9xCgg97y0Q6Yd4XdaEvIU1x8/fcUWykbPnKbo8f1S0X6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/l2J+UgUh90MwKbTeYCL1FC/v5gtuYzlGNp/R4ZAV58+KpZ3w
	ArQVBoMLbINfUjxccGkRh6pX0w5CGUzDFjjmmsGDELBMw3VKM8E3IUg9X73HlSrgJ1RRB686dY1
	EBdFQ2EsvRUByY4mPCjMH8biBBWXZFp0uDZny07S6KQ2fnNMU1D3f/aCnTdONeA3T
X-Gm-Gg: AfdE7cnBQpjVmxlPqk3NSGgkYeH3J7yarBO56n4Rfk0Tpx72++oVGi9/Eba5PgiQEHc
	wQWsyw6JmLpvBb9PVltgwlBnHi5rob/B1wVBnk9K5E52+KAh8mIEp4QxU2bECcasxLkRn77FQqr
	Se8COb0SE36gzgw4+5IyW1irku/4mFn5nb7QGMC0FY6Qe+rstpmE2heUVYwY/3B6uw1PVZToEZN
	TqdCe4/Ef3zO38J4ceRLIRGgEgXciPkcJjSKXbowoKNFODPD+5ucQLhCjxprznpj0KfVxeQXAsA
	2VdXVSTM5SKLDkYmfUz0JnfzRIjSyduDwHmy1gfaBlERskDzxqTPibrDiAwAGiHbbrqfg6VBpVQ
	ViXB7j6I1kG9/ZgXcj4L8YpiVDVHiXp2pjbQu7t9k7RPCrg==
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940751cf.35.1782747077198;
        Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940241cf.35.1782747076630;
        Mon, 29 Jun 2026 08:31:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51bf0697775sm45079741cf.26.2026.06.29.08.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:31:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:31:14 -0400
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
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
Message-ID: <akKPwt8PN_UtawAg@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
 <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f8q65c7h8H7UF2SjkcoFL_fz1SNtfEBItKuW5fCpqfU_1782747077
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2026 at 12:11:18PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains, resets, etc. We
> > currently have dev_set_drv_sync_state() where a framework or driver
> > can set the sync_state callback for a device node, however it currently
> > only supports a single sync_state callback.
> > 
> > The pmdomain subsystem currently sets up a sync_state callback in the
> > core framework, and the clk subsystem will setup it's own separate
> > sync_state callback in the core framework. These can collide with each
> > other on some types of devices that have multiple types of resources.
> > Additionally, some clk drivers already have their own separate
> > sync_state callback already defined.
> > 
> > Let's introduce support for allowing drivers and frameworks to add their
> > own sync_state callback via a new function dev_add_sync_state() so that
> > multiple sync_state callbacks can coexist.
> > 
> > Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> 
> [...]
> 
> > +int dev_add_sync_state(struct device *dev,
> > +			   void (*fn)(struct device *dev))
> > +{
> > +	struct sync_state_entry *entry;
> > +
> > +	if (!dev || !dev->driver)
> > +		return 0;
> > +
> > +	list_for_each_entry(entry, &dev->sync_state_list, node)
> > +		if (entry->fn == fn)
> > +			return 0;
> 
> Do we expect this to be a valid call, i.e. should we WARN_ON here?

That's a good point about adding a WARN_ON() here. I kept this logic
from when I converted from dev_set_drv_sync_state().

Brian

