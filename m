Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFDEEC0
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 02:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784515281; cv=pass; b=JhW5Poy6tD+dMi5+EFaQaJMWKusLx2MeCzAUvYUpCyM/i0Jk4LdVjMuk4SRu5vNOcy3+ONsVLk30SGRwn34ySf1BZ91k8YkWvYNUfDUixChixi3AmZEcx0vyIpOtHCFdfz8+kJF+QRB1xrw2K1OF0YuxB23ng4ZizojhvtEoUWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784515281; c=relaxed/simple;
	bh=ZW8ix5o3Cp6tpAdB4hsxiqJX1RClMZspckdEPlWfVqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9DSllGTgPf64xu+aF4bHMuFjKsr0d5VY9eU5hega549+eJkoaQ8nGkn6vjLXjjRp1K3CjsCHkxA+dcxQAfiFAXdCZkdyGvRfgjDP2xDRQZalOkl1xkbOU2zd1POpB0zdaN4Pr0LMkj3uV1fvp5f11EBisjdlh8URHIQkwIHlSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alKkJKEF; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alKkJKEF"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso7226996a91.1
        for <driver-core@lists.linux.dev>; Sun, 19 Jul 2026 19:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784515280; cv=none;
        d=google.com; s=arc-20260327;
        b=sBbCHEGZpcfc0bafF6TrEBe5FjRcAUq4pkRiEbVE51dmIW+QrDcapD8Y6oS1UL0Iyz
         sUp7PWZ2B8aVdZiSpoiFJX8/mSn2ot9Jc83QGT1gpSOX5DaDc62WL8fS1ixD2q1Je8LZ
         KHRYSubKQflf4MdrTXncfhtmL91k+2q3AOGVhAEdS4YDR4PzCytLxh7Y0gb11WnMjf93
         Q1MH+L6cbOgO5qiGyvCZmYAoeryHs+bjrAGMyPiN19PlJzuMj6ZpB12lqFhWP1W7+Rzw
         ewOVRlGsMwmBCnijVK6EceSxXm9Dkh+ycut4MYvZwFW563lmqvvAdzmQuaADA27isQFh
         86/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZW8ix5o3Cp6tpAdB4hsxiqJX1RClMZspckdEPlWfVqc=;
        fh=LDZ6RIfY0zAv34JHVRC/f+vAbcgBdarf52sAHGLTiJc=;
        b=rsCucRaljENEjzakWuWkgcdbSPkh+yHkvxSwe4+Ti6WUsaR4z2sxtat9tFCG1hUFvZ
         m6A3dGPmdlo/WxyziFC+n+7uhP2IT6TGp1t2tSzWY0cVzJYLS1EQZbiCQQBkEiw5isAp
         8GsjvLHzCxhCDVRsG/a3S1h0UWNxVSvWhfXLV08U94I4Bl24Kw7o9qhMaYyd9+Hvu4kZ
         T5ZpUm5BPF1Ki4sIKuYbz9i+aOZRdMDTo4pj8749FazBlnqHJHbL6nhETbk+tkAQMWaN
         dNDxwd2pJ7jvjGt4LShVIqKKgxXYnVyAQdkbnSgMuvupylTfSsXQ6hDwRFphikAt6s4+
         Dsbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784515280; x=1785120080; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZW8ix5o3Cp6tpAdB4hsxiqJX1RClMZspckdEPlWfVqc=;
        b=alKkJKEFBKChcubVwbDpMh+np630+3BUIgpgXXv0LcrPqNPz7Ah1dnwKbMrDm4JMGn
         owgjb8jIKx2Kfuj4U6CH422foIriL0jJ84jJbGwaY9nUT5lD5t/0isF4DMtL0o6rLPG1
         HYWXiYrHhYMYIk/9AFhwqYFzwPmRgvc88MTgg6X+uZLRy2Mqwc0EUitIef0GVybVS0cD
         BwlWstMlhq+A9sAgDdRfWsGqqtwT9l79bkO1XaAD4SQgGBe26mi0ftTKVvUJBVrralRf
         68daEHXClyxO+aE4DoTjA07cJ5/Ek2JlPf1aH6o7EimJiCdnuZgQjp5Y9RrvI2ywqIQf
         DL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784515280; x=1785120080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZW8ix5o3Cp6tpAdB4hsxiqJX1RClMZspckdEPlWfVqc=;
        b=aQuu3SbB/D/250g3ipkgL+T4PRUs5zM4habxn5Je4bKi8ULn7iqvnW4e2ZK3JwVPM6
         jWskTXieSg6cqo6lwZof6moaAm6c/FxW/Q1CFFCsogJsfdFEGyNV6Phvgjfr3cUkQjiF
         JBc1sdAZV1/6X43F7rVoaP++J89CLGPpYyZ3ModNMInN8Ykflo/OlTHtKdIgCQQgAp3k
         0VeTiqaiugc40dC1karvvzqHNZls7VLa7n/jn1sTXPoxRu+Zr1ZNXO9TzcJob4mzj6Yi
         jV5jWUuGjKYfBgONBJR1DDabeXZcVp3JqKE/NY8Rj/utNSqu0VQW4urid648vQHDoRnh
         H89Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2dVtV65Rz/g/YqNIt82H80wrOjE5rTK0JdVlv7kdxKTBlTpE+WjMNGHmaS8VV/jQoiZUNYhyTloaRTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNyU9JT9EF7WMTDpbptuCR+fsQgx4poG0gOlTVdiJH55aocioy
	A5VNJ/0eUtOdp2SKwvNdxX35KkrUJl0vYLhoeZyYM922OSmpBY7tBPxqJHrFK/5ZosBKbOsPU9A
	AmlkApRu3VpVVJnrNdBMAblH+zY6xmuY=
X-Gm-Gg: AfdE7cmDaHt6trvSkrWcADkuiCQY/nXoeflMraEIPYpNv25tjmZB537NM1ZSCGsw/55
	7Rs8BCqXM9GiwZyLmHe9g1EZjYzxUt5pHZIC7IOBssbSh+nohsLetYTnGrXWruWwPL0zlyzToUW
	Pt6fVS77izs1wTHEXfAzqOS/vTGoYTvoy0z3/m6ED9vSeNsO5g8xOlVc6wkTzSyCAyVYfizj1jX
	zmvuELRKfD1qi+UNWr1LZrQBwGZRZFy+f45rKq3ueBWBvATDXzHplFWFSZoj/IVIIHfbyWWbYzx
	WDpsBwDrM7U2Auxi
X-Received: by 2002:a17:90b:570e:b0:38e:6c37:d95a with SMTP id
 98e67ed59e1d1-38e6c37dec7mr5812613a91.19.1784515279840; Sun, 19 Jul 2026
 19:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715052100.24983-1-phucduc.bui@gmail.com> <4e43250d-85eb-4019-b092-039e10e84ae1@sirena.org.uk>
 <CAABR9nE=eYDfd8rJpOGyhC3d5E1tteUW+7vgHBBWKpU4sN8PUw@mail.gmail.com> <ce5acc9f-3447-46f7-b096-fb7eebcbd6b3@sirena.org.uk>
In-Reply-To: <ce5acc9f-3447-46f7-b096-fb7eebcbd6b3@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 20 Jul 2026 09:41:07 +0700
X-Gm-Features: AUfX_mxGe-NbPS2EtJX99k8gvHDxZEw0ypDg6iwrabDqJtrzIVUgc0R4rPybtH0
Message-ID: <CAABR9nFRhg5YE6X2QCYQ4Zu9LuQi+vgaNai1s8MF8rHQE-2PqQ@mail.gmail.com>
Subject: Re: [PATCH] regcache: Warn if regcache_sync() is called in cache_only mode
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the clarification.

>
> That's for the caller.
>

Understood. I'll keep the current behavior and leave the error
handling to the caller.

> I'd have hoped it'd be fairly obvious that the device is in an
> indeterminate state after a failed sync, TBH if I/O isn't working
> recovery options are going to be *super* limited.

I won't make any documentation changes.

Best regards,
Phuc
