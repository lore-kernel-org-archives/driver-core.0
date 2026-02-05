Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1D38BF93;
	Thu,  5 Feb 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297336; cv=none; b=nRsuROHybDIvmItFnlvSjNXQd6y/EbG1F1BptY/9YIBoECnpBRcUaU/nKhavEkIeVFQJcF6fGrZT7jy9gJ3B358PsxWlZPW6Zjn82oD1PFdUpblLSQ2RWFzhgsmxuRuJPdtaxmkIKkNxFx7Xc9pt5nZgg7tHnN0hHrj5A5whG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297336; c=relaxed/simple;
	bh=xyPsHBDXNELvRtj41vPaS2+W1D3zQB/qdQNUClTT3mw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RIpYV1JmbklmikShVeHlXmIW4KqbIfvxfWAaJhQE5ILXApeR+OM0Dlahu90POZeomd0NAgVUBuFIP7bAi75Sc8qPB61Nv3+CxFbWUYNJs0DMlo4NAnfU9Qyn/WbVJzvrbE586r7T61GmZ2al5UtrXxU2TeAWbfWGGFcMkjVcwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANMV9Mgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANMV9Mgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8276DC4CEF7;
	Thu,  5 Feb 2026 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297336;
	bh=xyPsHBDXNELvRtj41vPaS2+W1D3zQB/qdQNUClTT3mw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ANMV9Mgip1DPNQLL61Q8mKTXpXXOUvMuDvbYcRGLVe4UymnMfj4O2LruQ+QbyIZIg
	 3jfO2L4Axl2T/I6JZjTr0qhGjUok6sZXN5uG0J5cej9vsbhEBIgL3WniZcRrLno+Y/
	 c8g/lb83SciVO1ZjSX16ophYhJ08Hh+fytF2e4z1kRKogmBHwq6K8MmeUK2gehO8fo
	 pTPiHmq1OnLCYDA5gdOVCIMwLYvQt6ags7ofPs3g4NXw28B1AgI5wymeyPCzfEU65D
	 1S6I4yiuKveWOIW1cA9JZE7cKsOnbyWA2IqarvM7vOoS/eq2+t5+FcTciFUhxa50nS
	 p/Hw7DDQGc8Zg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 14:15:33 +0100
Message-Id: <DG7213W6OWVS.E9CGC7T6O1CP@kernel.org>
Subject: Re: [PATCH 2/2] driver core: remove device_change_owner() export
Cc: <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2026020541-energize-graduate-981a@gregkh>
 <2026020543-molar-childcare-af20@gregkh>
In-Reply-To: <2026020543-molar-childcare-af20@gregkh>

On Thu Feb 5, 2026 at 2:09 PM CET, Greg Kroah-Hartman wrote:
> The function, device_change_owner() is exported for modules to use,
> but there are no in-kernel users of it, so remove the export to prevent
> out-of-tree code from thinking this is a safe function to call.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
