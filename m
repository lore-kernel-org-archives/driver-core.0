Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5E3ED132;
	Wed, 20 May 2026 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288226; cv=none; b=e9eQZdfrAGhF1MGDzy2arzMEWv31ayrM3SQGcBF1VfeWZ4hEmULgQo7NbzdRTyE6v1yXuyOx6/vbrgrbYk4sB9iusNAAfpRI3/w8p72oG2hTFnSgXQpjuH/HAkmvm7ZTeRqrKGfo1JpduTxaJHHCRChLH+qvKK1RUDNZXkP65EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288226; c=relaxed/simple;
	bh=VZallclgOjr2wEWF4MTjQ7EEFmYD65ALoKpesHf2AK8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ctBgr2oTBrqVdGBajBS02su8A+IfR44vSvHxYu1iuECzwd2EKhDsT5xk6CQMGQ4IBn8XWdm4VQua61SF8sH0i2lAGaYVV/5CMJy6F6I9XAneGgn9JWSp5149xYKQOa4SYLyArNisQtAybV7kYeGW3DHDItoNNYuok0/1xyfDBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfuK0N4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfuK0N4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2C91F00897;
	Wed, 20 May 2026 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288224;
	bh=VZallclgOjr2wEWF4MTjQ7EEFmYD65ALoKpesHf2AK8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OfuK0N4jcGpAq6Ox8yjNQ/rUzJD9HDpU/k32MhvGpAUmoamc2yyw9xmDMyfboNG8e
	 PmaVTVv7QyQa7BGNi0LIzsxTbx2eEMBOttQWiLamXUyP2O13b3xmlkALfNZltZnHzp
	 kLFC6SiyQSO5KcZvEWBAGKE79i7u+N8bfPD+yEK6siKAeFQ5tuJwx3gdTXwdemJmQw
	 LL4L6v5CfATpjx4rPxj0GxYpzReRIAieJb8s+hLEleQmMgJpFm4a5hi23/xF53Bxx+
	 seAkxmSylCCBIJR4Ku8OhtbQ3elLCa77rUfsjJASAicgFFFOMCY/2AUL6e1nwkT2Ol
	 DGZ5HiqtMbB0A==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 16:43:42 +0200
Message-Id: <DINL18ZHVV2F.390OXFCNKGDA2@kernel.org>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "NeilBrown" <neil@brown.name>, "Tejun Heo"
 <tj@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2026052000-drove-unicycle-d61b@gregkh>
In-Reply-To: <2026052000-drove-unicycle-d61b@gregkh>

On Wed May 20, 2026 at 3:07 PM CEST, Greg Kroah-Hartman wrote:
> sysfs_kf_seq_show() defends against buggy show() callbacks that return
> larger than PAGE_SIZE by clamping the value and printing a warning.
> sysfs_kf_read(), the prealloc variant, has no such defense.
>
> The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
> whose show() callbacks are well-behaved, so this is hardening against
> future drivers doing foolish things and out-of-tree code doing even more
> foolish things.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: NeilBrown <neil@brown.name>
> Cc: Tejun Heo <tj@kernel.org>
> Fixes: 2b75869bba67 ("sysfs/kernfs: allow attributes to request write buf=
fer be pre-allocated.")
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
