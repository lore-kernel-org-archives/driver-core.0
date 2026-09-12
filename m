Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822652F361B
	for <driver-core@lists.linux.dev>; Sat, 12 Sep 2026 03:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183705; cv=pass; b=UsEUmTTOgpJ8lxqV032y7JNJTuqGjL+cifw5foWbANYM8QSTHMkHC9u+PpLHpLyJerdR9jcgtuqdAqZ61gecXIe6FURJ9azXbHn7kCb/JI+J3CpcPiOMnjzFux+3j/QwhqNNhiG54VLPQM35Of2NDE/D6Rj2Im1ysHL3eXXIU4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183705; c=relaxed/simple;
	bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMAcqoihL7XgXVPRPXlsOe0APwtC/UGglyYQlWIfYr+bGceHiWeiq7C0zL0jKZ56MS69WmHEhmZGzC/JKVNnxJRl4lVZTDRQRjEfAmydgFwfkP0mctZ3T5G2ogINozfNymTWxKX13LYL27gXHa0kMdVnQGyJN8XKlKE6Tjk3xVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lac0i621; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lac0i621"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so296004266b.3
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 20:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789183703; cv=none;
        d=google.com; s=arc-20260327;
        b=F+0yjtJYhJCPP5Ia8Hf7bwKF8lLDjf1h/jckioooVnT94qT2XaC55RmuuW6djOaHvj
         OXDPhem4Yia1Yhh77zGyEUJieHEz+cn17qalX8cAtMEepQNTRCEutnSrB4KUAxyOaWr5
         LNUl2z/kdT1xnIz5WTIKOWgB62P8801+KXvFU/X4oCzgLuzlBcTKPBCOu5DprruxUZXL
         0482bL7/a+a30cwAm5qC15hosnYp6RZ2OtaIHxRwKcWpUpTX445fwARuLbkYdm1eNn/m
         IkTciBUbQ/73w5gON8laOJ2BSSM+MOCkT+5UJX/O3Ceg+0HUIv8vY8cbqaufhfbGsAsT
         RZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        fh=IHFd4BusKfe9IPyGfPZrxjUy6cMg+3DWJb7XpsuSYAk=;
        b=s06pd3nsf0N3N5kaaooPfPvHtReBsSU1Mtl4eQapPamFhT/uATR256DzegQKzs0rjO
         wEWFQWV19BFmKD4sd9r73dQt+KqwUWNZDOJK4WRZtx+Li06Lpl76GNDxu433N9j58C88
         CvpOQqkl1BajjZ2mWbAFDYp2HlbQmo+uz91L92kYfeyVtkdC4GYLX12vK9AFttVZyXNp
         S2HEgtNqFaIebC4tq7/4Wy3d1I/Ck3MFuWojVDudldqf2+XymPXBZgPXDLiL4HpdOkLf
         ZlHssRnfY3iArMDbjkvTRaWTkIigYU3YY/mZW9VI+QM9YVxguYBmqaUGmMBIIm2Mgd+8
         uZng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789183703; x=1789788503; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        b=lac0i621b5d+3+w2nVnO6dJHzXWcupnCKmbZcf56QjPwP2Z+Oh1A1OipC0wphJLM8b
         5qundXxzr5rBD54n12MFlC7RyXYYSpxrdLkSFfqGFHPCt7Jl4wjOIVXAShsDjAyAIaw5
         AZkUlV+xY+1lJsTJtsOPq6PS4Av7KAvTlSR6B7S5hKljGeuiRNClCt9CVgJKfi1Tvb2f
         7G7uNgtCobaT0Dx6DaeG23Gkooe2Ii2EffXmw+f0S5HiyhxVYGEQiWB/j5utNyXg5yLB
         bTKl0EwTWf+G1kzCqtnQSQoqi0nlFlEj7XU6utjpCLn+eiHZ3OodKQuXHfTbxe4JygQu
         8sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789183703; x=1789788503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        b=pqN1JMDbppXQRFNkuhN71G8pXYYbj2ao56ER9HbxT+5hg1ff1OTUvCMPdwk/dK6shh
         odFBjb16W7sLIICGTx/sf0M1sTpaLYwzSA3/FpSqjCDgsLcUCFmXyjtPuvDoEPtgHYgy
         WjpU8ut7Q0EAjVPdWto+WszDo4QOFFRAkCuLaMrAhsyzikuNXzcXXqtg6CjlkT0CcmS1
         nwwd1tBMjHEroeWkz+BZFLPtAirz0oC9BnHiOCXFKalMrJ1DOeV9J4HXCX20JU1bIQEC
         Tgdf59BMlLhFugUrsZFqUIpmiS7+V6jAWwgtxmXB1gT1rcyjZVg4+4ZGsM9Mu8ldyvjq
         wgUw==
X-Forwarded-Encrypted: i=1; AKwUvBzyl4f69i1QoTc++DJRZ4Zde/hxQ8KQKYVBRWTs0aLy5Wxq07H6ILs7roFilhhXb6VFXNQJyj2oeffVwA==@lists.linux.dev
X-Gm-Message-State: AFuF++nOk7oEd2N075crVPKwz3qBbyJTkrQypPpckfrbn7oFhrG6UhgU
	nya2gUOodtrmbAe+a4xo2WhlGRes1toNc/8lyviNy30M1OIanpmOeKfTh5BPEehhKoDM6+HhkzL
	N+OTYwX4d+AGAEafqu+aZTy+SN6ibt4uwI6u+jBe4
X-Gm-Gg: AYBFou1v0UbY1Km3A+FhDWOyTHdgiqQ9iUYEOu0e+kW4pgvJGS0cJtar5ptaDCurax2
	2eVrJWB2cmPH9/Y1npdZFIPYZQcWydchLWpJvxcmjlE5bt/kw8Y1nfs6Jxg7aD8jji+kw7pH5mH
	oM1hjFCo/GTnV/jxX8gwYhiVy0OoaAq/Oljha2Hg0sKcUv7SlOnScfVEfAdKs3r6coX3iPCLSUw
	9C2saIwv8A4alzifRkjpNABedgDOIRwitaDZadU0gce0v9LyMV2DNKoETEo+6B/ZKBJJbYGrC09
	n97Y1VqajoKYbpO2FvYcU7ZFKLiRkAxGYG15WN14EHVjN4gRkoo25+U=
X-Received: by 2002:a17:907:73cd:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c29666bc8e7mr322816766b.24.1789183702219; Fri, 11 Sep 2026
 20:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev>
 <20260821050507.2161607-5-shakeel.butt@linux.dev> <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
 <aqRWuffGKczUhegT@linux.dev> <CAB=BE-SjW76gWr0kZcPnEjXOwt90vCV0TJeFuYEGV1Kt4Y1HWw@mail.gmail.com>
 <aqTB1AVmFVs08T19@linux.dev>
In-Reply-To: <aqTB1AVmFVs08T19@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 20:28:10 -0700
X-Gm-Features: AcwNN1VO6EcQR5hpLcEQjEGDOjZUhnBSVqjAAjK3VKqqwhWLJwfDUgsFug31q_Q
Message-ID: <CAB=BE-S-fOqvjj5s=M588tdUDDgDMAxOF7SE6Sm-9vara3=snw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shakeel,
> I don't see how reclaim can set dentry->d_inode = NULL for a dentry with
> elevated dentry->d_lockref.count because kernfs_dop_revalidate gets the dentry
> whose dentry->d_lockref.count is elevated. Reclaim specifically skips such
> dentries.

Thank you for your input! That may explain why I am unable to reproduce led by
memory stress narrative. Let me attempt to reproduce this first and I
will provide an update.

Thanks again,
Sandeep.
