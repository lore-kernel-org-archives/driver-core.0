Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03C52FE4E
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 16:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094875; cv=none; b=u6faVg9lIcwKLxfxjVRpNrlINoqSz6QCXdLwWYC4sXPc1s5VGt1LGXGeNXe+zndGODcpffHjkNOedHDjKmY5PUkFsFVNMbeK8+zYbbYoiNcojrhDu9aKND5cKYWhk8old9apIqYBIWA6nOuOfT4F612HrDJYBIFlFzFVHG4bcEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094875; c=relaxed/simple;
	bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1cn9IDi+JuTvWHbW7b7KHTs4hBjx06Z7tMW7nAYyegq14i1Rm78X0F792qQYde4CwrZWAzXfRPe6U1C8hvB/f/re78xVOuAnF9jXcTIpyo97RSSFg2igSDRf4opWa25UoExyiKqYzl5R3qcXYDbPjICOCtlSKFblVaznctgyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AB0zXoy1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AB0zXoy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790094872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
	b=AB0zXoy1Yvcm012ebd22g93OJbpurDQn8u1uHe5d8RzsT3ZMpvCxh+yo0EUJqXz7bfpG5G
	PKjxa7qRnG1F6zZ1ph085yF6pgjNLW2brVmm5iZ6VKBRiBZG/P9YOQ0hCC7epr0C7KjsEH
	+G6OYZB0KHfZrCFF7neyM9Bu0OgJUss=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-xnGhDw66NdCiP8o3Lv269w-1; Tue, 22 Sep 2026 12:34:31 -0400
X-MC-Unique: xnGhDw66NdCiP8o3Lv269w-1
X-Mimecast-MFC-AGG-ID: xnGhDw66NdCiP8o3Lv269w_1790094871
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso42114e0c.0
        for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094871; x=1790699671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKbRWUWUNFCMJjKOH3yHgRtEpoahj/lRVoNkkOfXTsg=;
        b=GF+V9D/DUkw7MusYFmVAiNeg9u0uEfln3WyhFxTzBPPB6XpyOsLvb0wbCzhd1q2JAj
         CCxKOiwbjHp5Afjc/ukhBfLs/2MI9BQ3iMLqOtj7qzbofWAiq0GBed2bdPzsAn8BSHoz
         zSaztbtI6X29VCqzI5DTZkkhWNoSP/HJpNDmZSj8lylsnl6bT4yHk/tfK9/5+mEI6xsD
         OFTnawiigNnFannRRdOzGxrm6DWHN9HmtdnPH5M5/vvuRH2YzoZFDAtGbsY7Q7VBokq9
         nP9m22fUudL5PB9r4fI2aztXVizu2LPmgQZQ1bgPqtbHQHL2jnk4in66fmo5dwwz3Tpg
         +rpA==
X-Gm-Message-State: AFuF++mJFiluWtQpvlMfGXDf/OO19275I0c1SKnyd25rQxJ4fPbhQYQ7
	ru4YtrFTEyW2kGqTO0m6J9ZaXLfR8+QZilSC3ORfQoe9O0B+bG5mhPdk8HjRSJlzVhKjLxmMDB2
	fS7Knr4xl6qNSrEMoNsLB99JcCylICFl/RZrZl//+YpPV782StSmjGkPonpGqLNpf0RveQVeDjl
	URlTonzXwtJuvSCM24k+q+GBD6LKK9eaU4wUXrzvrfIvMSs2eovw==
X-Gm-Gg: AYBFou1gFt/9R76nbo+4hSbCRyoCj4Bxaf7a6icws7SpImv76r2g0uW1lvyAQZF1PDY
	adhVD23y7M319PVvqIc+KUnsPgUNym+cppENnx+l0mQ4GX/KYvWLOrCQPcHnpWs9OGPsKeQWXP2
	MFTKgfKLTHlq3tHDOzacwkYJPVlzs4tZFsA5R3ejzaer9xGjQ5Jf1E7vfYjWf9Ox0NQcLELp9ar
	Q9ykYXmOvojyP2DkpDfPqP0Dj3wjp2aKgxHgi8wl9YmlRe5IgpQUBRcM2X0jFcICyAchFgGvPo=
X-Received: by 2002:a05:6122:4d01:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c9f15bb2a3mr57776e0c.7.1790094870713;
        Tue, 22 Sep 2026 09:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4d01:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c9f15bb2a3mr57708e0c.7.1790094870278; Tue, 22 Sep 2026
 09:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917163744.191748-1-djeffery@redhat.com>
In-Reply-To: <20260917163744.191748-1-djeffery@redhat.com>
From: David Jeffery <djeffery@redhat.com>
Date: Tue, 22 Sep 2026 12:34:19 -0400
X-Gm-Features: AclHuK_gOIIAGH-J9mfA_6kGZQPoZd_UXxbRIgUMsQf82GPy6D8kJfhp32jIMog
Message-ID: <CA+-xHTE65H=WSU4kavq7dC=FkaMVKuEZiNw5-o5DekRpgRkDeA@mail.gmail.com>
Subject: Re: [PATCH v22 0/9] shut down devices asynchronously
To: driver-core@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, kexec@lists.infradead.org, 
	Ewan Milne <emilne@redhat.com>, John Meneghini <jmeneghi@redhat.com>, 
	"Lombardi, Maurizio" <mlombard@redhat.com>, Bart Van Assche <bvanassche@acm.org>, 
	John Garry <john.g.garry@oracle.com>, Jeremy Allison <jallison@ciq.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Pasha Tatashin <tatashin@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Op7b0hOI76-8ta-nMVyWv_s6flQKa-MiXLM1iy3bs4Q_1790094871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 12:37=E2=80=AFPM David Jeffery <djeffery@redhat.com=
> wrote:
>
> These patches are rebased against the driver-core tree's driver-core-next
> branch and should also apply against recent linux-next. Changes for v18 a=
re
> contained in patch 3.
>
> This patchset allows the kernel to shutdown devices asynchronously and
> unrelated async devices to be shut down in parallel to each other.
>
> Only devices which explicitly enable it are shut down asynchronously. The
> default is for a device to be shut down from the synchronous shutdown loo=
p.
>
> This can dramatically reduce system shutdown/reboot time on systems that
> have multiple devices that take many seconds to shut down (like certain
> NVMe drives). On one system tested, the shutdown time went from 11 minute=
s
> without this patch to 55 seconds with the patch. And on another system fr=
om
> 80 seconds to 11.
>
> And thank you to everyone who has spent some of their valuable time
> providing reviews, suggestions, criticisms, or tests on the various
> iterations of this patchset.
>
> Changes from V21:
> - Check a device is alive before accessing its bus pointer
>

And this has resolved Sashiko's last complaint. Sashiko found no
issues with the v22 patchset.

David Jeffery

