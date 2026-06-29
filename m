Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2587382F31
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747258; cv=none; b=AeX0LUJpLm87epvC1qCwFnQYCAHUKPZdUl+eciqMgAy8D/eNrxDP6fKO5LgDBWT8KFzgxQWCiZwS4OxIfRLQpIrKrlAy5ZV7163ZWD9EAVZycMhLtSH/lhUfacdSPg7t6SGwHcwTfw51UEi+WAErxiRSaud93cyZmCGQR6FswfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747258; c=relaxed/simple;
	bh=Sy6JGeil4deLnMSvof8VqxcsucaS49cWaMJykRuqdh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dp8b7FbHXOI6IT5jYTG6ZOrkG4j9Q8jxXFUg+UG3YlCz3eyxZ6GtCfCL7KhlZY5GbQjIaxL4783C/1O+era6md43uXfMxzWmIgI6KdctcdXi0WsxvIZ0hovmSkvQo1Zb0fOvm3bJB/d273gc0bUNJBKVlU5m7schzOPh3V1q9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAYXxvfN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAYXxvfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782747255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jyH6F/rzycE55igieO5QcOyc46xwfU6NRg+LIEtIXp0=;
	b=JAYXxvfNjhyV/xUDTAWQdmOyWOgaM63xzWzXXmGFLm7hlqLcR8LUgMTATdh7OX82Vofrro
	jL1v/Y/wAeQgrGukOQ891bjP197B3IOQEkBXni9v8u/apEt4pk09iT+qI9xKwSuCYApLyP
	pqg8WxJTmL/N18KA4isJzGnxX6n6H44=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-ho3CleQ6OgqXUReYYHt_zA-1; Mon, 29 Jun 2026 11:34:14 -0400
X-MC-Unique: ho3CleQ6OgqXUReYYHt_zA-1
X-Mimecast-MFC-AGG-ID: ho3CleQ6OgqXUReYYHt_zA_1782747254
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9674fae89e9so1043486241.3
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 08:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747254; x=1783352054;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyH6F/rzycE55igieO5QcOyc46xwfU6NRg+LIEtIXp0=;
        b=ESJwMrnLCuwqCcLLVsXmC5ybRSFEj/um31zESf3gXnvAEKGvi5ywcEK6PiFq77V3P2
         KKd8l/T8xgCAovRwHdEv1aIoQFK6EpZB/h2iOEl8WrivKTsClgob4hhYijrwPUipS3e7
         wwCye0EKO06LV4kZlXXQtu/Aa8fh06KWMVguupqUay4VoPNZMa73ey7yBvnG86EKsfz9
         9w/6vjgzl82tusr1DJb1tASbsmZ60HvNuWMdNilQy+ZvIsMU1479EziMm2l27iz/Yebh
         5B2xOEcoHNVcMqwojbEacNqG50TZZ/NvOxEziPCNr2mJKHre/1xURzpXBtK4Lobiy5ul
         VAqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8AUsnUawEZ77LXR3R+PcVJWz8l6HxZQkGL2hwIdTBWrjMP2QJd2Ok60p+LltiOdpm8IUvL2G24zoPGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygjCpRUGIqlyQjzqt6nFYDKbrF9dw5K+7j6GXAYnbK8nUXLFWY
	bfSNtSF0PJDzDxx7cYkehihcci5QCL5oUhM23zbPQieLQlv0ebl8A/2DIrwZcoobN6KpfacEc7J
	10jJGajaSTQEdYfH9blbnBfYCn34hu8iLtC2Dv0YahaDhLZzUSpXevnP70s8BgHKG
X-Gm-Gg: AfdE7cm4l1clLtgTYsVDUc9SemIeL2ksC3DOcBf274qm6gbi6T2MS7GVBjNI6JkT/eU
	X3fFVX42XFf7EYaD9irBmBwb+QTCCfziM03ksFl5PkGbSvTn1tglpzn/ZzBi0NbSejAa5sAqdMr
	RCqS+M++ScVWPQ+KcuPVKuGP4Hd8oESU3FfCyIR6VUyr8NAr9/g36HmkOmgKzbaCbwsTxxVzyJd
	QGCCSiC+QUf0hBURKN0v/KFzFyjQSLUFWi2QKZYQV4S5KdTU9uENvAkjfamWijosw9Vr5o68W8v
	6X89zbGGvxnzjouTNa66KGtZQtA5c/8J5p/N/X7JsVdBgJ0E9UbDdPNrrKQ/4RLiOyjhgq7NYnz
	ywX15ECrf1vU3/XbNGf1xsgTOTNfQiAGc7orKKLtLslP7bQ==
X-Received: by 2002:a05:6102:4187:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-73a366f5f9bmr155599137.9.1782747253714;
        Mon, 29 Jun 2026 08:34:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-73a366f5f9bmr155536137.9.1782747253174;
        Mon, 29 Jun 2026 08:34:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a3580949sm1005826d6.21.2026.06.29.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:34:12 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:34:10 -0400
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
Subject: Re: [PATCH 0/4] clk: implement sync_state support
Message-ID: <akKQciC87HxiwZPj@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LRjMtnV9PpWi4QSymK7FzNF78X-ermNtPwrIzImu1s4_1782747254
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2026 at 12:06:19PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > The existing support for disabling unused clks runs in the late initcall
> > stage, and it has been known for a long time that this is broken since
> > it runs too early in the boot up process. It doesn't work for kernel
> > modules, and it also doesn't work if all of the consumers haven't fully
> > probed yet. Folks have long recommended to boot certain platforms with
> > clk_ignore_unused to work around issues with disabling unused clks.
> > 
> > This series fixes this by adding support for sync_state to the clk
> > subsystem.
> > 
> > Changes in v3:
> 
> The version tag is missing from the subjects of the patches you sent
> By the trailers, it seems like you used b4.. did you play with
> prep --force-revision by chance?

Oops, yea that was my bad. I mistakenly got too aggressive with rebasing
my branch, and I dropped the commit that had the cover letter / b4
metadata the previous day. I didn't know the old SHA, so I had to
start over with a new b4 managed branch, and cherry pick my patches on
top. I forgot to run b4 prep --force-revision to force it to v3.

Brian

