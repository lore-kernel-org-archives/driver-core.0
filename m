Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E4550DA5
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955838; cv=none; b=PSKU/eUkZKq+PNuNBl2eY0JjaJNQvuFLB49TG17ShrPWiCTkjFVyGkSsxyHJoYihY1QrzUAFlwA+VdQeAYyJ0mo2ZIfV8GSr9Mffw1u2tzOV00J7vDZnOpKk2Gybi7Q/HgpkUkHjJGXSLVaiBZWTExnuFV5pi9rlsRnmTjO/Wuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955838; c=relaxed/simple;
	bh=DvwtVb5IKeMYxO2D23yno0EzlJiATMbD/Z8h9/0BjRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IERhfj30cYGNPxAW0fIugX7BadjRy0DQEXbsx6zdYo9zEBgUtCG6bVtU/0VoLchMOgRJ/YDbwB93Lu9b4LwVVbYmpmxuQs4adaeeevWp096yecyOpyRF2nsavrdim6WhWTDt7DIiXBbmeS6i7M1Sl/vxY5tDK/LFt7vaEKwckhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ip69aeoj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ip69aeoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788955835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc9MzoiCKhsJwxuQzTyGvb7DKHhftnS4Vlp/tiC9CaA=;
	b=Ip69aeojROhcM41a3ZrVuBrqEE4BM1eWjeUx6JV9xiuWvm5jsZYxRItVb80kMFHdwOeC7p
	trD3io7haWfxeMcN3OHVOL82idznKf5mnMATe/B04kUqvZVGV+5RwYXtFeoc4KZ8wNRZoJ
	MNTNJa2nHsgLBf6NFYGRYMX4i3wXCSE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-pTLvXbpQOFShNbm_4lWvzg-1; Wed, 09 Sep 2026 08:10:34 -0400
X-MC-Unique: pTLvXbpQOFShNbm_4lWvzg-1
X-Mimecast-MFC-AGG-ID: pTLvXbpQOFShNbm_4lWvzg_1788955834
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ce8ad8002so108609266d6.2
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 05:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955833; x=1789560633;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc9MzoiCKhsJwxuQzTyGvb7DKHhftnS4Vlp/tiC9CaA=;
        b=iE9N7cbsvR5dCursk8zelNy0Nok/zBjzrBX4cvf/5hY+2De8IGhaNNN/IWnPXe+AzW
         xTBGCzri9pt2w+JeuKu60EOztjODQnRav9B4qf5+hjmPLN7EMsQfijJFmMKOFKJMmHl7
         09uhRt+FCLp+8aqU2m4VyEaxKIPEOFruAeBCxH1vl3h2CdehoRv8/0KAEFTq0jHfXQS4
         XrFGqglboZf1u2+aalsrJll51RF+MJUcGi2KOLNSpspxlYpyYtu4ldxKnubi6oQXVBVt
         ySxkoeLzEQilWlAd/HK8stLJa9qFayiLN8ngTuXnwlLvFE1IlSjg1x2DQRFliE+0eC/m
         m2tw==
X-Forwarded-Encrypted: i=1; AKwUvBw+mwyCwrJaAjD2tzbc99S8C/PSx4xZ6/E6v8TMFeeTXZRwmDSa7v/1c5kXREyC1yBd7r3lZ91HYH2Z8w==@lists.linux.dev
X-Gm-Message-State: AFuF++kt2lb5iLz1sSzZio4BFSogKVPGHwjKFMmb1vKOUJfiFj5ehbTS
	9/t4L2oa4oYbwjULzsx/vl+MRfPBB5d7Q05SnnHECcXBLJnwaCEjNmuJQXdS+O5fOrPMJZkRU6o
	qkTUrXGs1ld4LZ6pj1ldxNKaXwZqnOzLXrUa73Wifc9W4TTuFIUuBlUtk+d4O2a1u
X-Gm-Gg: AYBFou0KHwgPX5d958uLn3/ixSufzSywQHhmt2aer61JnXescvRVw5mzGchzo29fteP
	cyDIP+3pqTQvzy38kPShDFUyp7szMXwXHBp1DK7n7nWqOA84+Y4PgFXZ+/6vzN1errY9fm68yCj
	7aPz7x91Q+10oB85KJu/5yVN0sg0LH6obGjG51M9z2q+2oW4710Irg8qWy8C84jvKnMvbdd2KAP
	KdauTmPQEFVYzr/+r0d2aUS47ezBx4F9aeMgVZfF7QZCyoq141ne7EXl6MBzqsz/6Z2r0Rv6Cd9
	yXlb0+uURzyqoqCqprvSDLABpIjxXhevrttPnLFGEngGTYxn/Z/3QaAJYp5KMUb8OlWH2w+lycz
	/tqb4wMHdHLkhL5gRNur+PeEU2wNTVit3dAs=
X-Received: by 2002:a05:6214:6004:b0:90c:e57f:e32f with SMTP id 6a1803df08f44-9103efa2278mr404159516d6.26.1788955833544;
        Wed, 09 Sep 2026 05:10:33 -0700 (PDT)
X-Received: by 2002:a05:6214:6004:b0:90c:e57f:e32f with SMTP id 6a1803df08f44-9103efa2278mr404158996d6.26.1788955833104;
        Wed, 09 Sep 2026 05:10:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040663a87sm145367976d6.19.2026.09.09.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:10:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 08:10:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <aqFMtfJINyZyqADO@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
 <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NFB_5vlO6yjWYpnPZcijrxh4o-guVph3Tn0rz5xVVR0_1788955834
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 02:45:21PM +0300, Abel Vesa wrote:
> On 26-09-08 13:47:20, Brian Masney wrote:
> > Reduce boilerplate code in the drivers and convert them over to use
> > subsys_platform_driver().
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-8
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks!

I forgot to mention in my commit description that I didn't convert
three Qualcomm clk drivers since they register two different drivers
in the same file:

drivers/clk/qcom/lpassaudiocc-sc7280.c:subsys_initcall(lpass_audio_cc_sc7280_init);
drivers/clk/qcom/lpasscorecc-sc7180.c:subsys_initcall(lpass_sc7180_init);
drivers/clk/qcom/lpasscorecc-sc7280.c:subsys_initcall(lpass_core_cc_sc7280_init);

Now whether or not they should be registered this early in the boot is a
separate discussion.

Brian

